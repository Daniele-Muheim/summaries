SUBFOLDERS = bw cna iteo isf ad fkom pmb mod dbs vsk

all:
	# make subfolders
	$(foreach var,$(SUBFOLDERS),make -C $(var);)

	# generate zip file contain all summaries
	mkdir -p summaries
	$(foreach var,$(SUBFOLDERS),cp $(var)/zusammenfassung.pdf summaries/zusammenfassung-$(var).pdf;)
	zip -r summaries.zip summaries/
	rm -rf summaries

clean:
	# clean all subfolders
	$(foreach var,$(SUBFOLDERS),make clean -C $(var);)

	# remove zip file with summaries
	rm -f summaries.zip

rebuild: clean all
