local args = require("Dev:Arguments")
local mw = require("mw")

local p = {}

function p.main(frame)
    local args = args.getArgs(frame)
    local nama = args["nama"]
    
    if nama then
        local dataPage = mw.title.new("Template:Penilaian/Data")
        local dataContent = dataPage:getContent()
        local found = false
        for line in dataContent:gmatch("([^\n]*)\n?") do
            local name, val1, val2, val3, val4, val5 = line:match("^(.-);(.-);(.-);(.-);(.-);(.-)$")
            if name == nama then
                found = true
                local tableHtml = mw.html.create("table")
                tableHtml:attr("class", "article-table")
                tableHtml:attr("style", "width: 100%; text-align: center")

                local row1 = tableHtml:tag("tr")
                local th1 = row1:tag("th")
                th1:attr("colspan", "5")
                th1:attr("style", "text-align: center")
                th1:wikitext("Performa " .. nama .. " berdasarkan OAA")

                local row2 = tableHtml:tag("tr")
                row2:tag("td"):wikitext("Akademik")
                row2:tag("td"):wikitext("Adaptasi")
                row2:tag("td"):wikitext("Fisik")
                row2:tag("td"):wikitext("Kontribusi Sosial")

                local row3 = tableHtml:tag("tr")
                row3:tag("td"):wikitext(val1)
                row3:tag("td"):wikitext(val2)
                row3:tag("td"):wikitext(val3)
                row3:tag("td"):wikitext(val4)

                local row4 = tableHtml:tag("tr")
                local th4 = row4:tag("th")
                th4:attr("colspan", "5")
                th4:attr("style", "text-align: center")
                th4:wikitext("Keseluruhannya")

                local row5 = tableHtml:tag("tr")
                local td5 = row5:tag("td")
                td5:attr("colspan", "5")
                td5:wikitext(val5)

                return tableHtml
            end
        end
    		if not found then
    		return mw.html.create("span")
    		:attr("style", "color: red")
    		:wikitext("Error: Tidak ada nama murid dengan nama ".. nama)
		end
    else
        return "Error: nama parameter is required"
    end
end

return p
