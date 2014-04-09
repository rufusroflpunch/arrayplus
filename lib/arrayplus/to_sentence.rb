class Array
  #####################
  # This is intended to mimic the to_sentence from ActiveSupport. It is optional to
  # prevent conflicts with other similar methods. To use:
  #   require 'arrayplus/to_sentence'
  #
  # === Options
  # This has a slightly different set of options than the ActiveSupport version of
  # this method.
  #
  # * +:last_word_connector+ - The word to join the last two elements of the list.
  #   Default: " and "
  # * +:words_connector+ - The element that joins all but the last two elements.
  #   Default: ", "
  # * +:capitalize+ - True/false which capitalizes first letter.
  #   Default: true
  # * +:end_punctuation+ Punctuation to end a sentence with. For no punctuation,
  #   use "". Default: "."
  # Example:
  #   ["one", "two", "three"].to_sentence # ==> "One, two and three."

  def to_sentence(options = {})
    options[:last_word_connector] ||= " and "
    options[:words_connector] ||= ", "
    options[:capitalize] = true unless options[:capitalize] == false
    options[:end_punctuation] ||= "."

    str = ""

    self[0..-3].each { |a| str += a.to_s + options[:words_connector] }

    str += self[-2].to_s + options[:last_word_connector] + self[-1].to_s
    str += options[:end_punctuation]
    str.capitalize! if options[:capitalize]

    return str
  end
end
