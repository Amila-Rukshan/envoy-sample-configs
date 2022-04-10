function envoy_on_request(request_handle)
    local request_headers = request_handle:headers()
    local log_output = "\n"
    for key, value in pairs(request_headers) do
        log_output = string.format("%s> %s: %s \n", log_output, key, value)
    end
    if request_handle:body() then
        log_output = log_output .. request_handle:body():getBytes(0, request_handle:body():length()) .. "\n"
    end
    request_handle:logInfo(log_output)
end

function envoy_on_response(response_handle)
    local response_headers = response_handle:headers()
    local log_output = "\n"
    for key, value in pairs(response_headers) do
        log_output = string.format("%s< %s: %s \n", log_output, key, value)
    end
    if response_handle:body() then
        log_output = log_output .. response_handle:body():getBytes(0, response_handle:body():length()) .. "\n"
    end
    response_handle:logInfo(log_output)
end

-- func-e run -c extending-envoy/8lab1luascript-211220-095401.yaml

-- curl -X POST localhost:10000 -d "<name value=\"peter parker\"></name>" -v

-- curl -X POST localhost:10000 -d "{ \"a\":\"bcc\", \"d\": 233}" -v 