<?php

declare(strict_types=1);

namespace Framework\Rules;

use Framework\Contracts\RuleInterface;
use InvalidArgumentException;

class MaxRule implements RuleInterface
{
    public function validate(array $data, string $field, array $params): bool
    {
        if (empty($params[0])) {
            throw new InvalidArgumentException("Maximum length not specified!");
        }

        $length = (int) $params[0];
        return (int) strlen($data[$field]) < $length;
    }

    public function getMessage(array $data, string $field, array $params): string
    {
        $length = (int) $params[0];
        return "Exceeds maximum character limit of {$length} characters.";
    }
}
