import pymorphy2

words = ["лететь", "умный", "гусь", "быстро", "он", "ближнее", "даль"]

morph = pymorphy2.MorphAnalyzer()

with open("data.pl", "wt") as file:
    for word in words:
        parse = morph.parse(word)[0]
        forms = parse.lexeme

        for form in forms:
            if parse.tag.POS == "INFN" or parse.tag.POS == "VERB":
                number = form.tag.number if form.tag.number else '_'
                gender = form.tag.gender if form.tag.gender else '_'
                tense = form.tag.tense if form.tag.tense else '_'
                form_word = form.word

                s = f'verb({number}, {gender}, {tense}) --> ["{form_word}"].\n'.lower()
                file.write(s)

            if parse.tag.POS == "NOUN":
                number = form.tag.number if form.tag.number else '_'
                gender = form.tag.gender if form.tag.gender else '_'
                case = form.tag.case if form.tag.case else '_'
                form_word = form.word

                s = f'noun({number}, {gender}, {case}) --> ["{form_word}"].\n'.lower()
                file.write(s)

            if parse.tag.POS == "ADJF":
                number = form.tag.number if form.tag.number else '_'
                gender = form.tag.gender if form.tag.gender else '_'
                case = form.tag.case if form.tag.case else '_'
                form_word = form.word

                s = f'adjective({number}, {gender}, {case}) --> ["{form_word}"].\n'.lower()
                file.write(s)

            if parse.tag.POS == "NPRO":
                number = form.tag.number if form.tag.number else '_'
                gender = form.tag.gender if form.tag.gender else '_'
                case = form.tag.case if form.tag.case else '_'
                form_word = form.word

                s = f'pronoun({number}, {gender}, {case}) --> ["{form_word}"].\n'.lower()
                file.write(s)

            if parse.tag.POS == "ADVB":
                form_word = form.word

                s = f'adverb() --> ["{form_word}"].\n'.lower()
                file.write(s)
