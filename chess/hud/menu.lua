require "lib/gooi"

function initMenu()
    menu_style = {
        bgColor = component.colors.darkGray,
        showBorder = true,
        radius = 2,
        borderColor = component.colors.red,
        borderWidth = love.window.toPixels(5),
        borderStyle= "smooth",
        font = menu_font
    }

    gooi.setStyle(menu_style)

    panelGrid = gooi.newPanel({
        x = love.graphics.getWidth()/2-menuWidth/2,
        y = winHeight/2-menuHeight/2,
        w = 430,
        h = 150,
        layout = "grid 2x1"
    })

    panelGrid:add(
         gooi.newButton({
                text = "Start 2-Player",
                h = 20
            })
            :onRelease(function()
                print("2-Player Game Started")
                panelGrid:setVisible(false)
                menuActive = false
            end),
       
         gooi.newButton({
                text = "Quit",
                h = 50
            })
            :onRelease(function()
                love.event.quit()
            end)
    )
end

function drawMenu()
    love.graphics.setColor(0, 0, 0, 0.5)
    love.graphics.rectangle("fill", 0, 0, winWidth, winHeight)
    love.graphics.reset()

    love.graphics.setFont(title_font)
    love.graphics.printf("Awesome Chess", winWidth/2-menuWidth/2, winHeight/2-menuHeight, menuWidth, 'center')
    gooi.draw()

end

