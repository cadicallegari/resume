IMG=cadicallegari/latexbuilder
RUN_CMD=docker run $(args) -v $(shell pwd):/data -w /data $(IMG)

build:
	docker build -t $(IMG) .

cmd=/bin/ash
exec: override args=-it
exec:
	$(RUN_CMD) $(cmd)

pdf: override args=--entrypoint /bin/ash
pdf:
	$(RUN_CMD) -c 'for i in *.tex; do pdflatex -halt-on-error $$i; done'
