#  File: Books.py

#  Description: comparison of unique word usage in two books

#  Date Created: 2/8/2017

#  Date Last Modified: 2/8/2017

def parseString(st):
    s = ''
    st = st.replace("'s", ' ')
    for ch in st:
        if (ch >= 'a' and ch <= 'z') or (ch == "'") or (ch >= 'A' and ch <= 'Z'):
            s += ch
        else:
            s += ' '
    return s


def getWordFreq(file):
    #book = open(file, encoding = "utf8")
    book = open(file, 'r')
    unique = open("uniquewords.txt", 'w')
    allwords = open("allwords.txt", 'w')
    word_freq = open("wordfrequency.txt", 'w')

    book_dict = {}
    total_word_list = []
    total_words = 0

    for line in book:
        line = line.strip()
        line = parseString(line)
        words_line = line.split()

        for word in words_line:
            word = word.lower()
            total_word_list.append(word)

            if word in book_dict:
                book_dict[word] = book_dict[word] + 1
            else:
                book_dict[word] = 1
            total_words += 1

    word_set = set(total_word_list)

    for word in total_word_list:
        allwords.write(word + '\n')
    for word in word_set:
        unique.write(word + '\n')

    freq_map = list(book_dict.values())
    freq_dict = {}

    for freq in freq_map:
        if freq in freq_dict:
            freq_dict[freq] = freq_dict[freq] + 1
        else:
            freq_dict[freq] = 1

    trial = list(freq_dict.keys())
    trial.sort()

    for key in trial:
        word_freq.write(str(key) + ':' + str(freq_dict[key]) + '\n')

    book.close()
    unique.close()
    allwords.close()
    word_freq.close()


def main():
    test = getWordFreq("Return.txt")


main()