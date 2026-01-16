return {
    {
        'melbaldove/llm.nvim',
        dependencies = { 'nvim-neotest/nvim-nio' },
        config = function()
            require('llm').setup {
                -- How long to wait for the request to start returning data.
                timeout_ms = 10000,
                services = {
                    groq = {
                        url = 'https://api.groq.com/openai/v1/chat/completions',
                        model = 'llama-3.1-8b-instant',
                        api_key_name = 'GROQ_API_KEY',
                    },
                },
            }
        end,
    },
}
