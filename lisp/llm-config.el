(use-package gptel
  :ensure t
  :config
  (setq gptel-use-curl nil)
  (setq gptel-default-mode 'org-mode)
  (setq gptel-model   'deepseek/deepseek-r1-0528:free
	gptel-backend
	(gptel-make-openai "OpenRouter"
          :host "openrouter.ai"
          :endpoint "/api/v1/chat/completions"
          :stream t
          :key "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"
          :models '(deepseek/deepseek-r1-0528:free
                    z-ai/glm-4.5-air:free
                    qwen/qwen3-coder:free
                    moonshotai/kimi-k2:free
                    qwen/qwen3-235b-a22b:free)))
  (gptel-make-preset 'default
    :description nil
    :backend "OpenRouter"
    :model 'deepseek/deepseek-r1-0528:free
    :system "You are a large language model living in Emacs and a helpful assistant. Respond concisely. respond using chinese . respond using orgmode format,every response should be a subtree."
    :tools 'nil
    :stream t
    :temperature 1.0
    :max-tokens nil
    :use-context 'system
    :track-media nil
    :include-reasoning t))
