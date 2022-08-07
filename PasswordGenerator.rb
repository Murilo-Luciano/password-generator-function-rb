class PasswordGenerator

    def initialize
        @initial_options = {
            hasNumber: true,
            hasUppercase: true,
            hasLowercase: true,
            hasSymbols: true
        }
    end

    public

    def generate(length, options: @initial_options)
        chars_possibilities = handle_options(options)

        password = []
        Range.new(1, length).each do |i|
            password << chars_possibilities[rand(chars_possibilities.count)].chr
        end
        
        password.join
    end

    private

    def handle_options(options)
        # char code
        # 33 ... 126
        # 48 ... 57 -> number
        # 65 ... 90 -> uppercase alphabetic
        # 97 ... 122 -> lowercase alphabetic
        # 33 ... 47 -> symbol
        # 58 ... 64 -> symbol
        # 91 ... 96 -> symbol
        # 123 ... 126 -> symbol

        chars_possibilities = (33..126).to_a  # keep in Range class or make it a array ?
        number_possibilities = (48..57).to_a
        uppercase_possibilities = (65..90).to_a
        lowercase_possibilities = (97..122).to_a
        symbol_possibilities = [(33..47).to_a, (58..64).to_a, (91..96).to_a, (123..126).to_a].flatten

        chars_possibilities -= number_possibilities unless options[:hasNumber]
        chars_possibilities -= uppercase_possibilities unless options[:hasUppercase]
        chars_possibilities -= lowercase_possibilities unless options[:hasLowercase]
        chars_possibilities -= symbol_possibilities unless options[:hasSymbols]

        chars_possibilities
    end
end
