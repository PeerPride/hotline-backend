# A codename is three words separated by hyphens
module CodenameGeneratorHelper
  def generate_codename
    components = []
    components << RandomWord.adjs.next
    components << RandomWord.adjs.next

    noun = ''
    loop do
      noun = RandomWord.nouns.next
      break if (noun.include? "_") == false
    end
    components << noun

    components.join('-')
  end
end
