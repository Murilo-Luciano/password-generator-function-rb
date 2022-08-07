# Password generator

## Generates you a password, according to the given length and options

```ruby
    PasswordGenerator.new.generate(10, options: {
            hasNumber: true,
            hasUppercase: false,
            hasLowercase: false,
            hasSymbols: true
    })

    # generates a password with 10 characters, numbers, symbols and no uppercase and lowercase letters
```
