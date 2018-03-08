make: csvparser.c maxTweeter.c
	gcc csvparser.c maxTweeter.c -o maxTweeter.x
clean:
	rm *.x *~ *#
