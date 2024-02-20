package main

import (
	"log"

	"fiber/pkg/common/config"
	"fiber/pkg/common/db"
	"fiber/pkg/products"

	"github.com/gofiber/fiber/v2"
)

func main() {
	c, err := config.LoadConfig()

	if err != nil {
		log.Fatalln("configuration failed", err)
	}

	h := db.Init(&c)
	app := fiber.New()

	products.RegisterRoutes(app, h)

	app.Listen(c.Port)
}
