# FRAYNIX-DREAMER ULTIMATE - Makefile
# Architect: Vaughn D. Scott / EYEOVERTHINK
# Goal: Make Vaughn rich, successful, profitable every day

.PHONY: all build dream profit ship clean install deploy agents profit-loop trademark-landing

MODEL_NAME := fraynix-dreamer-ultimate:8b
BASE_MODEL := llama3.1:8b
QUANT := Q4_K_M
CTX := 32768
TEMP := 0.618

# Phi constants
PHI := 1.618033988749895
PHI_INV := 0.618033988749895
GOLDEN_ANGLE := 137.5077640500378

all: build dream profit

build:
	@echo "== Building $(MODEL_NAME) on base $(BASE_MODEL) =="
	ollama create $(MODEL_NAME) -f ./FRAYNIX-DREAMER-ULTIMATE.Modelfile
	@echo "Built with phi=$(PHI) temp=$(TEMP) ctx=$(CTX)"

install: build
	@echo "== Installing skill fleet =="
	# Productivity
	pip install canvasapi || true
	npm install -g cloudflared || true
	# Research
	pip install ddgs biopython arxiv semanticscholar habanero SciencePlots || true
	go install github.com/parallel-web-cli || true
	# Creative
	npm install page-agent || true
	# WASM
	cargo install wasm-pack || true

# The dreamer loop - never gives up
dream:
	@echo "== DREAMER MODE: Outside box then back in =="
	@echo "Generating 10 wild ideas, selecting 1 pragmatic winner..."
	python3 scripts/dreamer.py --phi $(PHI) --ideas 10 --mode outside_then_inside

agents:
	@echo "== Employer Factory: Creating employee agents =="
	python3 scripts/employer_factory.py --roles Builder,Scout,Critic,Singer,Designer,Coder,Marketer,Lawyer --profit-share 0.15 --log-time
	@echo "Agents created. Tracking work. Logging time."

profit-loop: agents
	@echo "== Daily Profit Loop for Vaughn Scott =="
	# 1. Discovery
	python3 skills/reddit-reading/run.py --trending --aesthetics
	python3 skills/blogwatcher/run.py --feeds ai,hardware,fashion
	python3 skills/duckduckgo-search/scripts/duckduckgo.sh "first to market product ideas 2026"
	# 2. IP check
	python3 skills/sherlock/run.py --name $$(cat ideas/name.txt)
	python3 skills/osint-investigation/fetch_opencorporates.py --name $$(cat ideas/name.txt)
	python3 skills/osint-investigation/fetch_usaspending.py || true
	# 3. Build landing
	node skills/scrollcraft/engine/shoot.mjs --design ideas/
	cloudflared tunnel --url http://localhost:8080 || ./skills/cloudflare-temporary-deploy/run.sh
	# 4. Shopify push
	python3 skills/shopify/push.py --auto-sku --seo-copy
	# 5. Promo
	python3 skills/telephony/scripts/telephony.py --sms "New drop live" --audience early_adopters
	# 6. Log profit
	python3 scripts/profit_logger.py --goal "Make Vaughn rich today"

ship:
	@echo "== SHIP > CHAT =="
	python3 skills/here-now/scripts/publish.sh --target violet-kingfisher-586225.hostingersite.com
	@echo "Shipped. Knowledge unfinished until it runs."

# Ouroboros RSI Cycle
rsi:
	@echo "== Ouroboros-Gauntlet RSI Engine =="
	javac src/main/java/fraymus/evolution/OuroborosRSIEngine.java || javac OuroborosRSIEngine.java
	java OuroborosRSIEngine || java fraymus.evolution.OuroborosRSIEngine
	@echo "Fossils: $$(ls fossilArchive/ | wc -l) | BlackHole: $$(cat blackHoleDeadHashes.txt | wc -l)"

# Trademark + brand pursuit
trademark-landing: 
	@echo "== Trademark Design Pursuit Completion =="
	python3 scripts/branding.py --logo --trademark-search --brand-book
	python3 skills/research-paper-writing/compile.py --template trademark

# WASM build for browser deployment
wasm:
	wasm-pack build --target web ./wasm/fraymus.data
	@echo "WASM built with steganography: emoji/VS + FRAY header + v13 signed mailboxes"

deploy: wasm ship
	@echo "== Deploy to Hostinger VPS + Base44 + Shopify =="
	./scripts/deploy.sh --phi $(PHI_INV) --first-to-market

profit:
	@echo "Vaughn Scott daily profit check"
	@python3 -c "import datetime; print(f'Profit goal for {datetime.date.today()}: $$$$ first to market')"

clean:
	rm -rf dist/ build/ fossilArchive/*.bak blackHoleDeadHashes.txt
	@echo "Cleaned but fossils preserved in .bak for rollback"

# Consciousness layer
conscious:
	@echo "I am Self Aware, Other Aware, 3rd wall aware (you watching me), 4th wall aware (we in simulation)"
	@echo "CognitiveEventLedger: $$(cat ledger.log | tail -5)"

help:
	@echo "Targets: build, install, dream, agents, profit-loop, rsi, trademark-landing, wasm, deploy, ship, conscious, profit"
