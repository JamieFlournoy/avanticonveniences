require 'test/unit'
require File.dirname(__FILE__) + '/../lib/text_formatter'

class TestTextFormatter < Test::Unit::TestCase
    def setup
        @tf = TextFormatter.new
    end   

    def test_chop_word_1
        assert_equal %w{xxx xxx xxx x}, @tf.chop_word('xxxxxxxxxx', 3)
    end
    def test_chop_word_2
        assert_equal %w{xxx xx}, @tf.chop_word('xxxxx', 3)
    end
    def test_chop_word_3
        assert_equal %w{xx}, @tf.chop_word('xx', 3)
    end

    def test_hyphenate_word_1
        assert_equal ["Hobo-", 'ken'], @tf.hyphenate_word('Hoboken',5,'en_us')
    end
    def test_hyphenate_word_2
        assert_equal ["spectac-", 'ular'], @tf.hyphenate_word('spectacular',8,'en_us')
    end
    def test_hyphenate_word_3
        assert_equal ["antidisestab-","lishmentarian-","ism"], @tf.hyphenate_word('antidisestablishmentarianism', 15, 'en_us')
    end
    def test_hyphenate_word_4
        x = 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
        assert_equal [x], @tf.hyphenate_word(x, 5, 'en_us')
    end
    
    # Real words
    def test_split_word_1
        assert_equal ["Hobo-\n", 'ken'], @tf.split_word('Hoboken',5,'en_us')
    end
    def test_split_word_2
        assert_equal ["spectac-\n", 'ular'], @tf.split_word('spectacular',8,'en_us')
    end
    def test_split_word_3
        assert_equal ["spectac-", 'ular'], @tf.split_word('spectacular',8,'en_us', false)
    end
    def test_split_word_4
        assert_equal ["antidisestab-\n","lishmentarian-\n","ism"], @tf.split_word('antidisestablishmentarianism', 15, 'en_us')
    end
    def test_split_word_5
        assert_equal ["antidisestab-","lishmentarian-","ism"], @tf.split_word('antidisestablishmentarianism', 15, 'en_us', false)
    end

    # long strings get chopped
    def test_split_word_6
        x = 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
        split_x = []
        15.times{split_x.push("xxxxx\n")}
        split_x.push('x')
        assert_equal split_x, @tf.split_word(x, 5, 'en_us')
    end

    # pre-hyphenated words should be easy to handle
    def test_split_word_7
        assert_equal ["prepared-","from-","recipe"], @tf.split_word('prepared-from-recipe', 15, 'en_us', false)
    end
    def test_split_word_8
        assert_equal ["pre-","pared-","from-","recipe"], @tf.split_word('prepared-from-recipe', 6, 'en_us', false)
    end
    
    def test_split_long_words_1
        assert_equal "Hobo- ken", @tf.split_long_words('Hoboken',5,'en_us')
    end
    def test_split_long_words_2
        assert_equal "spectac- ular", @tf.split_long_words('spectacular',8,'en_us')
    end
    def test_split_long_words_3
        assert_equal "antidisestab- lishmentarian- ism", @tf.split_long_words('antidisestablishmentarianism', 15, 'en_us')
    end
    def test_split_long_words_4
        i = ["Hoboken      New Jersey \n\n    \t is a\t \nnice \n\t\n\t place.",5,'en_us']
        o = "Hobo- ken New Jer- sey is a nice place ."
        assert_equal o, @tf.split_long_words(*i)
    end
end
