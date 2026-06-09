<?php

namespace App\Models\Concerns;

trait MapsLegacyAttributes
{
    public function getAttribute($key)
    {
        if (is_string($key) && $this->hasLegacyAttributeAlias($key)) {
            return parent::getAttribute($this->attributeAliases[$key]);
        }

        return parent::getAttribute($key);
    }

    public function setAttribute($key, $value)
    {
        if (is_string($key) && $this->hasLegacyAttributeAlias($key)) {
            $key = $this->attributeAliases[$key];
        }

        return parent::setAttribute($key, $value);
    }

    protected function hasLegacyAttributeAlias(string $key): bool
    {
        return property_exists($this, 'attributeAliases')
            && array_key_exists($key, $this->attributeAliases);
    }
}
