class TokenAuthorizer
  def initialize(app, logger, &block)
    @app = app
    @logger = logger
    @block = block
    @authorized_user = nil
  end

  def call(env)
    @logger.info env['PATH_INFO']
    headers = Hash[*env.select {|k,v| k.start_with? 'HTTP_'}.collect {|k,v| [k.sub(/^HTTP_/, ''), v]}
                        .collect {|k,v| [k.split('_').collect(&:capitalize).join('-'), v]}.sort.flatten]
    @logger.info headers

    @request = Rack::Request.new(env)
    @error_response = nil

    if env['PATH_INFO'].start_with?('/api/auth_token')
      check_password
    elsif env['PATH_INFO'].start_with?('/api') && !env['PATH_INFO'].start_with?('/api/users/new')
      check_auth_token
    end

    @logger.info @error_response

    return @error_response if @error_response

    env['authorized_user'] = @authorized_user if @authorized_user

    @logger.info "User: #{env['authorized_user']}"

    @app.call(env)
  end

  def check_password
    encoded_string = check_auth_header('HTTP_AUTHORIZATION')
    return if @error_response

    email, password = Base64.strict_decode64(encoded_string.split(' ')[1]).split(':')
    @authorized_user, authorized = @block.call(email, password, nil)
    @error_response = error_response('授权不正确') unless authorized
  end

  def check_auth_token
    auth_token = check_auth_header('HTTP_AUTH_TOKEN')
    return if @error_response

    @authorized_user, authorized = @block.call(nil, nil, auth_token)
    @error_response = error_response('授权不正确') unless authorized
  end

  def check_auth_header(auth_key)
    @request.fetch_header auth_key do
      @error_response = error_response('未提供授权')
    end
  end

  def error_response(message)
    body = {error: message}.to_json
    headers = {'Content-Type' => 'application/json', 'Content-Length' => body.bytesize.to_s}

    [401, headers, [body]]
  end
end