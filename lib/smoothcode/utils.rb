require 'openssl'

def generate_hmac(secret, base_string, digest_alg = 'sha256')
    digest = OpenSSL::Digest.new(digest_alg)

    OpenSSL::HMAC.hexdigest(digest, secret, base_string)
end