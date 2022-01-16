function on -d "Setup proxy environment variables"
    for proxy in http_proxy HTTP_PROXY https_proxy HTTPS_PROXY ftp_proxy FTP_PROXY all_proxy ALL_PROXY
        set -Ux $proxy "http://127.0.0.1:7777"
    end

    kwriteconfig5 --file kioslaverc --group 'Proxy Settings' --key ProxyType "1"
    for kdevar in kdevars httpProxy httpsProxy ftpProxy socksProxy
        kwriteconfig5 --file kioslaverc --group 'Proxy Settings' --key $kdevar "http://127.0.0.1:7777"
    end
end