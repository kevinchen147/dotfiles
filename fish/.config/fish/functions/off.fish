function off -d "Clear all proxy environment variables"
    for proxy in http_proxy HTTP_PROXY https_proxy HTTPS_PROXY ftp_proxy FTP_PROXY all_proxy ALL_PROXY
        set -e $proxy
    end
end