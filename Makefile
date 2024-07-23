# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ygaiffie <ygaiffie@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/07/19 21:33:40 by ygaiffie          #+#    #+#              #
#    Updated: 2024/07/21 05:19:17 by ygaiffie         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

RED				:=	\033[31m
GRN				:=	\033[32m
YEL				:=	\033[33m
BLU				:=	\033[34m
MAG				:=	\033[35m
CYN				:=	\033[36m
WHT				:=	\033[37m

BCYN			:=	\033[1;36m
BMAG			:=	\033[1;35m
BHCYN			:=	\033[1;96m
BRED			:=	\033[1;31m
BLGRN			:=	\033[5;32m
BGRN			:=	\033[1;32m
BHYEL			:=	\033[1;93m
BOLD			:=	\033[1m
NC				:=	\033[0m

COMPOSE_FILE	:= srcs/docker-compose.yml


all: init build up

build:
	@echo "\n\t[🛠️ ] $(BHCYN)Construction des images Docker avec Docker Compose...$(NC)\n"
	@docker compose -f $(COMPOSE_FILE) build

up:
	@echo "\n\t[🚢 ] $(BGRN)Lancement des conteneurs avec Docker Compose...$(NC)\n"
	@docker compose -f $(COMPOSE_FILE) up -d

logs:
	@echo "\n\t[📜 ] $(BMAG)Affichage des logs des conteneurs...$(NC)\n"
	@docker compose -f $(COMPOSE_FILE) logs -f

clean:
	@echo "\n\t[🗑️ ] $(BRED)Suppression des conteneurs ...$(NC)\n"
	@docker compose -f $(COMPOSE_FILE) down

fclean: stop clean
	@echo "\n\t[🗑️ ] $(BRED)Suppression de toutes les images et conteneurs...$(NC)\n"
	@docker container prune -f
	@docker image prune -a -f
	@docker volume prune -f

stop:
	@echo "\n\t[🛑 ] $(BRED)Arrêt de tous les conteneurs...$(NC)\n"
	@docker ps -q | xargs -r docker stop
	
re: fclean all

debug: 
	@echo "\n\t[🐞 ] $(BRED)Installation des container de debug...$(NC)\n"
	@docker volume create portainer_data
	@docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest

init:
	@echo ""
	@echo "\t\t$(BCYN)┍━━━━━━━»•» 🐳 «•«━┑$(NC)"
	@echo "\t\t$(BHCYN) INCEPTION MAKEFILE $(NC)"
	@echo "\t\t$(BCYN)┕━»•» 🐳 «•«━━━━━━━┙$(NC)"
	@echo ""

help: init
	@echo "Usage:"
	@echo "  make build     : Build the Docker image 🛠️"
	@echo "  make run       : Run the Docker container 🚢"
	@echo "  make logs      : View the logs of the running container 📜"
	@echo "  make stop      : Stop the Docker container 🛑"
	@echo "  make rm        : Remove the Docker container 🗑️"
	@echo "  make clean     : Remove the Docker image 🧹"
	@echo "  make restart   : Rebuild and restart the Docker container 🔄"

.PHONY: all clean fclean re stop help init logs