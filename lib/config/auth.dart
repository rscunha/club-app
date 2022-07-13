const AUTH_DOMAIN = String.fromEnvironment('AUTH0_DOMAIN');
const AUTH_CLIENTE_ID = String.fromEnvironment('AUTH0_CLIENTE_ID');
const AUTH_ISSUER = 'https://$AUTH_DOMAIN';
const BUNDLE_IDENTIFIER = 'fertyl.b2c.app';
const AUTH_REDIRECT_URI = '$BUNDLE_IDENTIFIER://login-callback';
const REFRESH_TOKEN_KEY = 'refresh_token';
