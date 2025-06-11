package main

import (
	"net/http"

	"github.com/labstack/echo/v4"
)

type Fruit struct {
	ID   int    `json:"id"`
	Name string `json:"name"`
}

func main() {
	e := echo.New()

	fruits := []Fruit{
		{ID: 1, Name: "apple"},
		{ID: 2, Name: "banana"},
		{ID: 3, Name: "cherry"},
	}

	e.GET("/", func(c echo.Context) error {
		return c.String(http.StatusOK, "Hello World!")
	})
	e.GET("/fruits", func(c echo.Context) error {
		return c.JSON(http.StatusOK, fruits)
	})
	e.Logger.Fatal(e.Start(":8080"))
}
