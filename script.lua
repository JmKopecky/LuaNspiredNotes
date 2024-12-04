platform.apilevel = "2.3"

local screen = platform.window
local width = screen:width()
local height = screen:height()
local textArray = {}
local isCurrentlyMultipage = false
local pageRenderIndex = -1
local pageInfoDisplay = D2Editor.newRichText()
local displayMode = "empty"


function clearText() 
    for k in pairs (textArray) do
        textArray[k]:setVisible(false)
        textArray[k] = nil
    end
end


function on.construction()
    switchDisplayMode("empty")
end


function addText(xPos, yPos, width, height, text)
    textBox = D2Editor.newRichText()
    table.insert(textArray, textBox)
    textBox:move(xPos, yPos)
    textBox:resize(width, height)
    textBox:setText(text)
    textBox:setReadOnly(true)
end


function addPage(textList)
    for i,v in ipairs(textList) do 
        if v ~= " " then
            textPage = D2Editor.newRichText()
            textPage:move(0.01 * width, 0)
            textPage:resize(width * 0.99, height * 0.88)
            textPage:setText(v)
            textPage:setReadOnly(true)
            textPage:setVisible(false)
            table.insert(textArray, textPage)
        else 
            textPage = D2Editor.newRichText()
            textPage:move(0, 0)
            textPage:resize(1, 1)
            textPage:setText(v)
            textPage:setReadOnly(true)
            textPage:setVisible(false)
            table.insert(textArray, textPage)
        end
    end
    isCurrentlyMultipage = true;
    pageRenderIndex = 1
    setPageVisible()
end


function setPageVisible()
    for i,v in ipairs(textArray) do
        if i == pageRenderIndex then
            v:setVisible(true)
        else 
            v:setVisible(false)
        end
    end
    pageInfoDisplay:move(0, height * 0.88)
    pageInfoDisplay:resize(width, height * 0.12)
    pageInfoDisplay:setText("Page #".. pageRenderIndex .."/".. #textArray)
    pageInfoDisplay:setReadOnly(true)
    pageInfoDisplay:setVisible(true)
end


function trySetPageIndex(index) 
    if index > 0 and index <= #textArray then
        pageRenderIndex = index
        setPageVisible()
    end
end


function on.charIn(char) -- page swap handling
    if isCurrentlyMultipage then
        if char == "3" then -- go to next page
            trySetPageIndex(pageRenderIndex + 1)
        end
        if char == "9" then -- go to previous page
            trySetPageIndex(pageRenderIndex - 1)
        end
        if char == "1" then -- go to first page
            trySetPageIndex(1)
        end
        if char == "7" then -- go to last page
            trySetPageIndex(#textArray)
        end
    end
 end
 
 
 function hidePageLabel()
    pageRenderIndex = 1
    isCurrentlyMultipage = false
    pageInfoDisplay:setVisible(false)
 end


function switchDisplayMode(mode)
    displayMode = mode
    clearText()
    hidePageLabel()
    screen:invalidate()
    
   
    
    if displayMode == "empty" then
        addText(width*0.01,height*0.01,width*0.98,height*0.3,"Press Menu to view notes")
    end
    
    if displayMode == "notes_equilateral" then
        conversionList = {};
        table.insert(conversionList, "a=b=c=leg dimensions | A=B=C=60°\nh=altitude, K=area\n\\0el {h=((√(3))/(2))*a}\n\\0el {K=((√(3))/(4))*a^(2)}")
        table.insert(conversionList, " ")
        addPage(conversionList)
    end
    
    if displayMode == "notes_isosceles" then
        conversionList = {};
        table.insert(conversionList, "a,b,c=leg dimensions | A,B,C=angles | h=altitude on side c | K=area | A=B | a=b | 2A+C=180°\n\\0el {h=a*sin(A)=((c)/(2))*tan(A)}\n\\0el {c^(2)=4(a^(2)+h^(2))=4(1+sin^(2)(A))*a^(2)}\n\\0el {K=((1)/(2))*c*h=((1)/(4))*c^(2)*tan(A)}")
        table.insert(conversionList, " ")
        addPage(conversionList)
    end
    
    if displayMode == "notes_scalene" then
        conversionList = {};
        table.insert(conversionList, "a,b,c=leg dimensions, h=altitude on side c\nA,B,C,C'=angles, K=area \, A+B+C=180°\n\\0el {K=((1)/(2))bc*sin(A)}\n\\0el {((2K)/(P))=r}\n\\0el {h=a*sin(B)=b*sin(A)}")
        table.insert(conversionList, "Sines: \\0el {((a)/(sin(A)))=((b)/(sin(B)))=((c)/(sin(C)))=((c)/(sin(C')))=2R}\n\nCosines: \\0el {c^(2)=a^(2)+b^(2)-2ab*cos(C)=a^(2)+b^(2)-2ab*cos(C')}")
        table.insert(conversionList, " ")
        addPage(conversionList)
    end
    
    if displayMode == "notes_circleinscirctri" then
        conversionList = {};
        table.insert(conversionList, "Equilateral:   \\0el {r=((a√(3))/(6))}  \n  \\0el {R=((a√(3))/(3))}  \n  \\0el {r=((R)/(2))}")
        table.insert(conversionList, "Right Tri:   \\0el {r=s-c=((a+b-c)/(2))}    \\0el {R=((c)/(2))}    \\0el {r=R(((a+b-c)/(c)))}    \\0el {a,b=((2r+c)/(2))±((√(8c^(2)-4(2r+c)^(2)))/(4))}\n\\0el {b=((2r(a-r))/(a-2r))}    \\0el {c=(a-2r)+((2r(a-r))/(a-2r))=a+b-2r}")
        table.insert(conversionList, "Scalene: \\0el {K=√(s(s-a)(s-b)(s-c))}  \\0el {s=((1)/(2))(a+b+c)}    \\0el {r=(s-c)*tan(((C)/(2)))=(((a+b-c))/(2))*tan(((C)/(2)))}  \\0el {R=((abc)/(4K))}   \\0el {r=4R*sin(((A)/(2)))*sin(((B)/(2)))*sin(((C)/(2)))}")
        table.insert(conversionList, " ")
        table.insert(conversionList, " ")
        table.insert(conversionList, " ")
        addPage(conversionList)
    end
    
    if displayMode == "notes_scalingeq" then
        addText(width*0.01,height*0.01,width*0.98,height*0.27,"\\0el {((L₂)/(L₁))=((h₂)/(h₁))}         \\0el {((A₂)/(A₁))=(((L₂)/(L₁)))^(2)}")
        addText(width*0.01,height*0.28,width*0.98,height*0.4,"\\0el {((V₂)/(V₁))=(((L₂)/(L₁)))^(3)=(((A₂)/(A₁)))^(3/2)}")
    end
    
    if displayMode == "notes_inscribedpolygon" then
        addText(width*0.01,height*0.01,width*0.98,height*0.5,"Regular Polygons\ns=side length of polygon\na=apothem (center to midpoint of side)\nR=circumcircle radius")
        addText(width*0.01,height*0.45,width*0.35,height*0.35,"\\0el {a=((s)/(2*tan(((180)/(n)))))}")
        addText(width*0.01,height*0.78,width*0.35,height*0.25,"\\0el {a=R*cos(((180)/(n)))}")
        addText(width*0.71,height*0.51,width*0.35,height*0.25,"\\0el {area=((a*p)/(2))}")
        addText(width*0.71,height*0.751,width*0.35,height*0.25,"\\0el {perimeter=n*s}")
    end
    
    if displayMode == "notes_powerpoint" then
        addText(width*0.01,height*0.05,width*0.33,height*0.17,"\\0el {AE*CE=BE*DE}")
        addText(width*0.37,height*0.01,width*0.33,height*0.17,"\\0el {AB^(2)=BC*CD}")
        addText(width*0.67,height*0.05,width*0.4,height*0.17,"\\0el {CB*CA=CD*CE}")
    end
    
    if displayMode == "notes_segmentssectors" then
        conversionList = {};
        table.insert(conversionList, "R=radius, K=area, c=chord\n\\0el {c=2R*sin(((θ)/(2)))}\n\\0el {K(segment)=((1)/(2))R^(2)(θ-sin(θ)) (radian only)}\n\\0el {K(sector)=((1)/(2))R^(2)θ (radian only)}")
        table.insert(conversionList, " ")
        addPage(conversionList)
    end
    
    if displayMode == "notes_hemisphere" then
        conversionList = {};
        table.insert(conversionList, "\\0el {Hemisphere: S=2πR^(2)=((π)/(2))D^(2)}\n\\0el {Hemisphere: T=3πR^(2)=((3π)/(4))D^(2)}\n\\0el {Hemisphere: V=((2)/(3))πR^(3)=((1)/(12))πD^(3)}")
        table.insert(conversionList, "\\0el {Sphere: S=4πR^(2)=πD^(2)}\n\\0el {Sphere: V=((4)/(3))πR^(3)=((1)/(6))πD^(3)}")
        table.insert(conversionList, " ")
        table.insert(conversionList, " ")
        addPage(conversionList)
    end
    
    if displayMode == "notes_cylinders" then
        conversionList = {};
        table.insert(conversionList, "Right Circular Cylinders:\n\\0el {S=2πRh  T=2πR(R+h)  V=πR^(2)*h}\nSlant/Right Cylinders of Any Shape:\n \\0el {S=sC=((hC)/(sin(θ)))   A=A'*sin(θ)  V=hA'=sA")
        table.insert(conversionList, " ")
        addPage(conversionList)
    end
    
    if displayMode == "notes_conespyramids" then
        conversionList = {};
        table.insert(conversionList, "Square-Base Pyramid:\n\\0el {h=((a*tan(α))/(√(2)))  s=((h)/(sin(α)))=((a)/(√(2)*cos(α)))   S=((a^(2))/(cos(α)))*√(1+sin^(2)(α))   T=S+a^(2)   V=((a^(2)h)/(3))")
        table.insert(conversionList, "Right Circular Cone:\n\\0el {s=√(R^(2)+h^(2))=((h)/(cos(θ)))=((R)/(sin(θ)))   S=πRs   T=πR(R+s)   V=((π)/(3))R^(2)h}")
        table.insert(conversionList, " ")
        addPage(conversionList)
    end
    
    if displayMode == "notes_frustumrightcirccone" then
        conversionList = {};
        table.insert(conversionList, "\\0el {s=√((R₁-R₂)^(2)+h^(2))  =((h)/(cos(θ)))   =((R₁-R₂)/(sin(θ)))}\n\\0el {S=π(R₁+R₂)s  T=π[R₁^(2)+R₂^(2)+(R₁+R₂)s]}\n\\0el {V=((1)/(3))πh(R₁^(2)+R₂^(2)+R₁*R₂)}")
        table.insert(conversionList, "R1 = radius of lower base (bigger radius)\nR2 = radius of upper base (smaller radius)\ns = slant height    h = altitude / height\nθ = semicone angle (half of angle at the tip)\nS = lateral surface area\nT = total surface area\nV = volume")
        table.insert(conversionList, " ")
        addPage(conversionList)
    end
    
    if displayMode == "notes_solidsrev" then
        addText(width*0.01,height*0.01,width*0.98,height*0.5,"Parallel to x-axis (y=b, Disc Method):\n\\0el {V=π∫({[f(x)-b]^(2)-[g(x)-b]^(2)},x,x₀,x₁)}")
        addText(width*0.01,height*0.5,width*0.98,height*0.5,"Parallel to y-axis (x=a, Shell Method):\n\\0el {V=2π ∫((x-a){f(x)-g(x)},x,x₀,x₁)}")
    end
    
    if displayMode == "notes_rectsquares" then
        conversionList = {};
        table.insert(conversionList, "a,b=side dimensions, p=perimeter, d=diagonal, K=area, All internal angles = 90° \n Rectangles:\n\\0el {a≠b  d=√(a^(2)+b^(2))  p=2(a+b)  K=ab}\nSquare:\n\\0el {a=b  d=a√(2)  p=4a  K=a^(2)}")
        table.insert(conversionList, " ")
        addPage(conversionList)
    end
    
    if displayMode == "notes_trapezoids" then
        conversionList = {};
        table.insert(conversionList, "a,b,s,t=side dimensions, a and b are parallel, h=altitude on side a, K=area\n\\0el {h=s*sin(A)      h=t*sin(B)}\n\\0el {K=((1)/(2))(a+b)*h}")
        table.insert(conversionList, " ")
        addPage(conversionList)
    end

    if displayMode == "notes_rhombusparallelogram" then
        conversionList = {};
        table.insert(conversionList, "a,b=side dimensions, p=perimeter, c,d=diagonals,h=altitude on side a, K=area, A,B,C,D=interior angles\n\\0el {Rhombus: A=C, B=D, a=b    A+B=180°  c=a√(2(1-cos(A)))=a√(2(1+cos(B)))  d=a√(2(1+cos(A)))=a√(2(1-cos(B)))  p=4a    h=b*sin(A)=b*sin(B)  K=ah=ab*sin(A)=ab*sin(B)}")
        table.insert(conversionList, "Parallelogram: \\0el {A=C, B=D, a≠b    A+B=180°  c=√(a^(2)+b^(2)-2ab*cos(A))=√(a^(2)+b^(2)+2ab*cos(B))  d=√(a^(2)+b^(2)+2ab*cos(A))=√(a^(2)+b^(2)-2ab*cos(B))  p=2(a+b)   h=b*sin(A)=b*sin(B)  K=ah=ab*sin(A)=ab*sin(B)}")
        table.insert(conversionList, " ")
        addPage(conversionList)
    end
    
    if displayMode == "notes_distpointline" then
        addText(width*0.01,height*0.01,width*0.98,height*0.99,"\\0el {d=((abs(ax+by+c))/(√(a^(2)+b^(2))))    with point (x,y) and line ax+by+c=0    Line MUST be in General Form!    CAN use in 3D! d=((abs(ax+by+cz+d))/(√(a^(2)+b^(2)+c^(2))))    with point (x,y,z) and line ax+by+cz+d=0}")
    end
    
    if displayMode == "notes_compoundinterest" then
        addText(width*0.01,height*0,width*0.98,height*0.16,"Simple Interest: \\0el {A=P(1+i)^(n)}")
        addText(width*0.01,height*0.15,width*0.98,height*0.27,"Compound Interest: \\0el {A=P(1+((i)/(q)))^(nq)}")
        addText(width*0.01,height*0.42,width*0.98,height*0.4,"Exponential: \\0el {A=P[((Ao)/(Po))]^(t/to)=P^(t/τ)}")
        addText(width*0.65,height*0.65,width*0.98,height*0.4,"where \\0el {τ=((to)/(ln(((Ao)/(Po)))))}")
    end
    
    if displayMode == "notes_rates" then
        addText(width*0.01,height*0.01,width*0.98,height*0.25,"\\0el {d=rt   therefore   r=((d)/(t))}")
        addText(width*0.01,height*0.25,width*0.98,height*0.15,"Avg. rate of each worker is harmonic mean")
        addText(width*0.01,height*0.4,width*0.98,height*0.4,"\\0el {r=((n)/(((1)/(r₁))+((1)/(r₂))+...+((1)/(r))))     t=((1)/(r)) if d is one task}")
        addText(width*0.01,height*0.8,width*0.98,height*0.3,"\\0el {((1)/(t₁))+((1)/(t₂))=((1)/(t))}")
    end
    
    if displayMode == "notes_percent" then
        addText(width*0.01,height*0.01,width*0.98,height*0.25,"\\0el {% Difference/Change = 100[((Number2-Number1)/(Number1))]}")
        addText(width*0.01,height*0.25,width*0.98,height*0.25,"\\0el {% Error = 100[((Aprox-Exact)/(Exact))]}")
        addText(width*0.01,height*0.5,width*0.98,height*0.25,"\\0el {% Increase = 100[((Large-Small)/(Small))] (always +)}")
        addText(width*0.01,height*0.75,width*0.98,height*0.25,"\\0el {% Decrease = 100[((Large-Small)/(Large))] (always +)}")
    end
    
    if displayMode == "notes_physics" then
        conversionList = {}
        table.insert(conversionList, "Acceleration Equations \n \\0el {v=v+a(t-t)} \n \\0el {d=d+v(t-t)+((1)/(2))a(t-t)^(2)}")
        table.insert(conversionList, "Trajectory Equations\n \\0el {d=((-v^(2)*sin(2θ))/(g))}     \\0el {d=((-v^(2)*sin^(2)(θ))/(2g))} \n \\0el {v=√((((-g)/(8d)))(d^(2)+16d^(2)))} \n \\0el {tan θ=((4d)/(d))}    \\0el {t=((-2vsin(θ))/(g))}")
        table.insert(conversionList, "Unequal Elevations\n \\0el {d=vt*cos(θ)} \\0el {t=((d)/(v*cos(θ)))} \\0el {d=d+vt*sin(θ)+((1)/(2))gt^(2)} \\0el {d=d+d*tan(θ)+((g*d^(2))/(2v^(2)*cos^(2)(θ)))}")
        addPage(conversionList)
    end
    
    if displayMode == "notes_conversions" then
        conversionList = {}
        table.insert(conversionList, "1 year ≈ 365.256 days\n1 inch (in) = 2.54 centimeters (cm)\n1 mile (mi) = 5,280 feet (ft)\n1 square mile (sq.mi., mi^(2)) = 640 acres\n1 teaspoon (tsp) = \\0el {1/6} ounce (liquid,oz)\n1 tablespoon (tbs) = 0.5 ounce (liquid, oz)")
        table.insert(conversionList, "1 cup = 8 ounces (liquid, oz)\n1 pint (pt) = 16 ounces (liquid, oz)\n1 quart (qt) = 32 ounces (liquid, oz)\n1 half gallon = 64 ounces (liquid, oz)\n1 gallon (gal) = 128 ounces (liquid, oz)\n1 cubic foot (ft^(3)) ≈ 7.481 gallons (gal)\n1 liter (l) ≈ 1.0567 quarts (qt)")
        table.insert(conversionList, "1 pound (avdp, lb) = 16 ounces (avdp, oz)\n1 pound (lb) ≈ 453.592 grams (g)\n1 ton = 2000 pounds (lb)\n1 revolution (rev) = 360 degrees (deg, °)\nπ radians (rad) = 180 degrees (deg, °)\n1 degree (deg, °) = 60 minutes (') [angle]\n1 minute (') = 60 seconds ('') [angle]")
        table.insert(conversionList, "Temperature: \n°C=5(°F-32)/9\n ≈ K - 273.15, \nwhere °C = Degrees Centigrade/Celsius, \n°F = Degrees Fahrenheit, \nK = Kelvins")
        table.insert(conversionList, "Metric System Prefixes: \nnano (n,10^(-9)),    micro (μ,10^(-6))\nmilli (m,10^(-3)),    centi (c,10^(-2))\ndeci (d,10^(-1)),    hecto (h,100)\nkilo (k,10^(3)),    mega (M,10^(6)")
        table.insert(conversionList, "Months of the Year: \nJanuary (31),    February (28*)    March (31)\nApril (30)    May (31)    June (30)\nJuly (31)    August (31)    September (30)\nOctober (31)    November (30)    December (31)\n*: February has 29 days on leap years (divisible by 4 and not divisible by 100)")
        table.insert(conversionList, "Fun Facts:    \nLength of football field (without end zones) = 100 yards (yd)    \nA deck of cards has 52 cards, 13 each of spades, hearts, diamonds, and clubs. Sometimes 2 jokers are added.\nDensity(water) = 1 gram/cubic centimeter (g/cc, g/cm^(3))")
        table.insert(conversionList, "g = acceleration on earth ≈ -32.174 ft/s^(2)    \nRadius of Earth ≈ 3960 miles    \nMass of Earth ≈ 5.98×10^(24) kg    \n1+x+x^(2)+x^(3)+x^(4)+x^(5)+...=(1-x)^(-1)    \n(x^(2)<1)")
        addPage(conversionList)
    end
end

powerpoint1 = image.new(_R.IMG.innerlinescircle):copy(width * 0.25, height * 0.35)
powerpoint2 = image.new(_R.IMG['1tancircle']):copy(width * 0.25, height * 0.45)
powerpoint3 = image.new(_R.IMG.singlepointinnercircle):copy(width * 0.25, height * 0.45)
inscribedPoly = image.new(_R.IMG.inscribedpolygon):copy(width * 0.25, height * 0.45)
interceptArcsAngles = image.new(_R.IMG.interceptedarcsangles):copy(width, height)
rectangle = image.new(_R.IMG.rectangle):copy(width * 0.8, height * 0.8)
trapezoid = image.new(_R.IMG.trapezoid):copy(width * 0.8, height * 0.8)
rhombparallel = image.new(_R.IMG.parallelogram):copy(width * 0.8, height * 0.8)
equitri = image.new(_R.IMG.equitri):copy(width * 0.8, height * 0.8)
isotri = image.new(_R.IMG.isotri):copy(width * 0.5, height * 0.8)
scaletri = image.new(_R.IMG.scaltri):copy(width * 0.8, height * 0.8)
segmentsector = image.new(_R.IMG.segmentsectors):copy(width * 0.8, height * 0.35)
hemisphere = image.new(_R.IMG.hemisphere):copy(width * 0.6, height * 0.8)
sphere = image.new(_R.IMG.sphere):copy(width * 0.6, height * 0.8)
cylinder = image.new(_R.IMG.cylinder):copy(width * 0.8, height * 0.8)
cones = image.new(_R.IMG.conepyramid):copy(width * 0.8, height * 0.8)
frustum = image.new(_R.IMG.frustum):copy(width * 0.4, height * 0.8)
circleequi = image.new(_R.IMG.circleequitri):copy(width * 0.6, height * 0.8)
circleright = image.new(_R.IMG.rightequitri):copy(width * 0.6, height * 0.8)
circlescalene = image.new(_R.IMG.scalequitri):copy(width * 0.6, height * 0.8)


function on.paint(gc)
    
    if gc == nil then
        return
    end

    gc:setColorRGB(0,0,0)
    gc:setPen("thin", "smooth")
    
    if displayMode == "notes_powerpoint" then
        gc:drawImage(powerpoint1, width * 0.25 * 0.25, height * 0.5)
        gc:drawImage(powerpoint2, width * 0.25 + width * 0.25 * 0.25 * 2, height * 0.40)
        gc:drawImage(powerpoint3, width * 0.25 * 2 + width * 0.25 * 0.25 * 3, height * 0.40)
    end
    
    if displayMode == "notes_inscribedpolygon" then
        gc:drawImage(inscribedPoly, width * 0.4, height * 0.55)
    end
    
    if displayMode == "notes_intarcsangles" then
        gc:drawImage(interceptArcsAngles, 0, 0)
    end
    
    if displayMode == "notes_rectsquares" and pageRenderIndex == 2 then
        gc:drawImage(rectangle, width * 0.05, height * 0.05)
    end
    
    if displayMode == "notes_trapezoids" and pageRenderIndex == 2 then
        gc:drawImage(trapezoid, width * 0.05, height * 0.05)
    end
    
    if displayMode == "notes_rhombusparallelogram" and pageRenderIndex == 3 then
        gc:drawImage(rhombparallel, width * 0.05, height * 0.05)
    end
    
    if displayMode == "notes_equilateral" and pageRenderIndex == 2 then
        gc:drawImage(equitri, width * 0.05, height * 0.05)
    end
    
    if displayMode == "notes_isosceles" and pageRenderIndex == 2 then
        gc:drawImage(isotri, width * 0.05, height * 0.05)
    end
    
    if displayMode == "notes_scalene" and pageRenderIndex == 3 then
        gc:drawImage(scaletri, width * 0.05, height * 0.05)
    end
    
    if displayMode == "notes_segmentssectors" and pageRenderIndex == 2 then
        gc:drawImage(segmentsector, width * 0.05, height * 0.25)
    end
    
    if displayMode == "notes_hemisphere" and pageRenderIndex == 3 then
        gc:drawImage(hemisphere, width * 0.05, height * 0.05)
    end
    if displayMode == "notes_hemisphere" and pageRenderIndex == 4 then
        gc:drawImage(sphere, width * 0.05, height * 0.05)
    end
    
    if displayMode == "notes_cylinders" and pageRenderIndex == 2 then
        gc:drawImage(cylinder, width * 0.05, height * 0.05)
    end
    
    if displayMode == "notes_conespyramids" and pageRenderIndex == 3 then
        gc:drawImage(cones, width * 0.05, height * 0.05)
    end
    
    if displayMode == "notes_frustumrightcirccone" and pageRenderIndex == 3 then
        gc:drawImage(frustum, width * 0.05, height * 0.05)
    end
    
    if displayMode == "notes_circleinscirctri" and pageRenderIndex == 4 then
        gc:drawImage(circleequi, width * 0.05, height * 0.05)
    end
    if displayMode == "notes_circleinscirctri" and pageRenderIndex == 5 then
        gc:drawImage(circleright, width * 0.05, height * 0.05)
    end
    if displayMode == "notes_circleinscirctri" and pageRenderIndex == 6 then
        gc:drawImage(circlescalene, width * 0.05, height * 0.05)
    end
end

function on.resize(gc)
    screen:invalidate()
end


-- define, create, and populate the menu
menu = {
    {"Triangle Notes",
        {"Notes: Equilateral Triangles", function() switchDisplayMode("notes_equilateral") end},
        {"Notes: Isosceles Triangles", function() switchDisplayMode("notes_isosceles") end},
        {"Notes: Scalene Triangles", function() switchDisplayMode("notes_scalene") end},
        {"Notes: Circles Inscribed/Circumscribed Triangles", function() switchDisplayMode("notes_circleinscirctri") end},
        {"Notes: Scaling Equations", function() switchDisplayMode("notes_scalingeq") end}
    },
    {"Circle Notes",
        {"Notes: Inscribed Polygon", function() switchDisplayMode("notes_inscribedpolygon") end},
        {"Notes: Power of a Point", function() switchDisplayMode("notes_powerpoint") end},
        {"Notes: Intercepted Arcs and Angles", function() switchDisplayMode("notes_intarcsangles") end},
        {"Notes: Segments and Sectors", function() switchDisplayMode("notes_segmentssectors") end},
        {"Notes: Hemisphere", function() switchDisplayMode("notes_hemisphere") end},
    },
    {"3D Geometry Notes",
        {"Notes: Cylinders", function() switchDisplayMode("notes_cylinders") end},
        {"Notes: Cones and Pyramids", function() switchDisplayMode("notes_conespyramids") end},
        {"Notes: Frustum of Right Circular Cone", function() switchDisplayMode("notes_frustumrightcirccone") end},
        {"Notes: Solids of Revolution", function() switchDisplayMode("notes_solidsrev") end}
    },
    {"Other Geometry Notes",
        {"Notes: Rectangles and Squares", function() switchDisplayMode("notes_rectsquares") end},
        {"Notes: Trapezoids", function() switchDisplayMode("notes_trapezoids") end},
        {"Notes: Rhombus and Parallelogram", function() switchDisplayMode("notes_rhombusparallelogram") end},
        {"Notes: Distance Point Line", function() switchDisplayMode("notes_distpointline") end}
    },
    {"Exponential Notes",
            {"Notes: Compound Interest", function() switchDisplayMode("notes_compoundinterest") end}
    },
    {"Rate Notes",
        {"Notes: Rates", function() switchDisplayMode("notes_rates") end},
        {"Notes: Percent", function() switchDisplayMode("notes_percent") end}
    },
    {"Miscellaneous Notes",
        {"Notes: Physics", function() switchDisplayMode("notes_physics") end},
        {"Notes: Conversions", function() switchDisplayMode("notes_conversions") end}
    }
}

toolpalette.register(menu)
