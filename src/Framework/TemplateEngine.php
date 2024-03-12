<?php

declare(strict_types=1);

namespace Framework;

class TemplateEngine
{
    private $globaltemplateData = [];
    public function __construct(private string $basePath)
    {
    }

    public function render(string $template, array $data = [])
    {
        extract($data, EXTR_SKIP);
        extract($this->globaltemplateData, EXTR_SKIP);

        ob_start();

        include "{$this->basePath}/{$template}.php";

        $output = ob_get_contents();

        ob_end_clean();

        return $output;
    }

    public function resolve($path): string
    {
        return "{$this->basePath}/{$path}";
    }

    public function addGlobal(string $key, mixed $value)
    {
        $this->globaltemplateData[$key] = $value;
    }
}
