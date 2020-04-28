# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/PerceivedComplexity
class Test
  attr_reader :file, :extension
  ERROR_BODY = [
    [/.;/, "Expected newline after ';' in a multi-line declaration block"],
    [/^\s{2}\w/, 'Expected indentation of 2 spaces'],
    [/.:\s\w/, "Expected single space after ':' with a single-line declaration"],
    [/\S;/, "Unexpected whitespace bofore ';'"],
    [/\S+\n$/, 'Unexpected whitespace at the end of the line']
  ].freeze
  BLOCK_HEADER_ERROR = [
    [/.\s{/, "Expected single space before '{'"],
    [/.\S\n/, 'Expected new line']
  ].freeze

  BLOCK_END_ERROR = [
    [/^\S/, 'Expected indentation of 0 spaces'],
    [/^\W/, "Expected newline before '}' of a multi-line block"]
  ].freeze

  ERROR_DESC = [
    [/^\s*$/, 'Unexpected empty line detected']
  ].freeze

  def initialize(url)
    @file = load_file(url)
    @extension = url.split('.')[-1]
    @block = false
  end

  def load_file(url)
    file = []
    return 'Enter Valid path for file' unless File.exist? url

    File.foreach(url) { |line| file << line }
    file
  end

  def run_test
    tracker = Hash.new(0)
    errors = []
    @file.each_with_index do |line, line_ind|
      if /[{]/ =~ line
        BLOCK_HEADER_ERROR.each_with_index do |err, i|
          line =~ err[0] ? next : errors << "#{line_ind + 1}: #{BLOCK_HEADER_ERROR[i][1]}"
        end
        @block = true
        next
      elsif /[}]/ =~ line

        @block = false
        tracker = Hash.new(0)
        BLOCK_END_ERROR.each_with_index do |err, i|
          line =~ err[0] ? next : errors << "#{line_ind + 1}: #{BLOCK_END_ERROR[i][1]}"
        end
        next
      elsif @block
        tracker[line.split(/\W+/)[1]] += 1
        if ERROR_DESC[0][0] =~ line
          errors << "#{line_ind}: #{ERROR_DESC[0][1]}"
          break
        end
        ERROR_BODY.each_with_index do |err, i|
          line =~ err[0] ? next : errors << "#{line_ind + 1}: #{ERROR_BODY[i][1]}"
        end

      end

      multi = check_multiplication(tracker)
      multi.empty? ? nil : errors << "#{line_ind}: Unexpected multi declaration of #{multi[0]}"
    end

    puts errors
    return '1 files inspected, no offenses detected' if errors.empty?
  end

  # rubocop:enable Metrics/CyclomaticComplexity
  # rubocop:enable Metrics/MethodLength
  # rubocop:enable Metrics/PerceivedComplexity

  def check_multiplication(hash)
    result = []
    hash.each do |key, value|
      result << key if value > 1
    end
    result
  end
end
