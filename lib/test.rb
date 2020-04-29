class Test
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
    [/^\S/, "Expected indentation of 0 spaces before '}'"],
    [/^\W/, "Expected newline before '}' of a multi-line block"]
  ].freeze

  ERROR_DESC = [
    [/^\s*$/, 'Unexpected empty line in rule body']
  ].freeze
  attr_accessor :errors
  def initialize(url)
    @file = load_file(url)
    @extension = url.split('.')[-1]
    @block = false
    @errors = []
    @tracker = Hash.new(0)
    @line = ''
    @line_ind = 0
    @count = 0
  end

  def load_file(url)
    file = []
    return 'Enter Valid path for file' unless File.exist? url

    File.foreach(url) { |line| file << line }
    file
  end

  def run_test
    @file.each_with_index do |line, line_ind|
      @line = line
      @line_ind = line_ind
      if /[{]/ =~ line
        error_collector(BLOCK_HEADER_ERROR)
        @block = true
        next
      elsif /[}]/ =~ line
        @block = false
        @tracker = Hash.new(0)
        error_collector(BLOCK_END_ERROR)
        next
      elsif @block
        tracker
        error_collector(ERROR_BODY)
      end
      check_multi_declartion(@tracker)
    end
    @errors
  end

  def tracker
    separation = @line.split(':')

    res = separation[0].split(/\s+/)
    @tracker[res[-1]] += 1
  end

  def error_collector(err_type)
    if ERROR_DESC[0][0] =~ @line && @block
      @errors << "#{@line_ind}: #{ERROR_DESC[0][1]}"
    else
      err_type.each_with_index do |err, i|
        @line =~ err[0] ? next : @errors << "#{@line_ind + 1}: #{err_type[i][1]}"
      end
    end
  end

  def check_multi_declartion(hash)
    result = []
    hash.each do |key, value|
      result << key if value > 1
    end
    @errors << "#{@line_ind}: Unexpected multi declaration of #{result[0]}" unless result.empty?
  end
end
