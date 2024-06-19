-- Created by Joseph Kopecky
platform.apilevel = "2.0"

local screen = platform.window
local width = screen:width()
local height = screen:height()
local textArray = {}
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


function switchDisplayMode(mode)
    displayMode = mode
    clearText()
    
    if displayMode == "empty" then
        text1 = D2Editor.newRichText()
        table.insert(textArray, text1)
        text1:move(width*0.01, height*0.01)
        text1:resize(width*0.98,height*0.3)
        text1:setText("Press Menu to view notes")
        text1:setReadOnly(true)
    end
    
    
    
    if displayMode == "notes_equilateral" then
        text1 = D2Editor.newRichText()
        table.insert(textArray, text1)
        text1:createMathBox()
        text1:move(width*0.01, height*0.01)
        text1:resize(width*0.98,height*0.3)
        text1:setText("a=b=c=leg dimensions | A=B=C=60°")
        text1:setReadOnly(true)
        
        text2 = D2Editor.newRichText()
        table.insert(textArray, text2)
        text2:createMathBox()
        text2:move(width*0.01, height*0.21)
        text2:resize(width*0.98,height*0.3)
        text2:setText("h=altitude, K=area")
        text2:setReadOnly(true)
        
        text3 = D2Editor.newRichText()
        table.insert(textArray, text3)
        text3:createMathBox()
        text3:move(width*0.01, height*0.41)
        text3:resize(width*0.98,height*0.3)
        text3:setText("\\0el {h=((√(3))/(2))*a}")
        text3:setReadOnly(true)
        
        text4 = D2Editor.newRichText()
        table.insert(textArray, text4)
        text4:createMathBox()
        text4:move(width*0.51, height*0.41)
        text4:resize(width*0.98,height*0.3)
        text4:setText("\\0el {K=((√(3))/(4))*a^(2)}")
        text4:setReadOnly(true)
    end
    
    
    
    if displayMode == "notes_isosceles" then
        text1 = D2Editor.newRichText()
        table.insert(textArray, text1)
        text1:createMathBox()
        text1:move(width*0.01, height*0.01)
        text1:resize(width*0.98,height*0.15)
        text1:setText("a,b,c=leg dimensions | A,B,C=angles")
        text1:setReadOnly(true)
        
        text2 = D2Editor.newRichText()
        table.insert(textArray, text2)
        text2:createMathBox()
        text2:move(width*0.01, height*0.15)
        text2:resize(width*0.98,height*0.15)
        text2:setText("h=altitude on side c | K=area")
        text2:setReadOnly(true)
        
        text3 = D2Editor.newRichText()
        table.insert(textArray, text3)
        text3:createMathBox()
        text3:move(width*0.01, height*0.3)
        text3:resize(width*0.98,height*0.15)
        text3:setText("A=B | a=b | 2A+C=180°")
        text3:setReadOnly(true)
        
        text4 = D2Editor.newRichText()
        table.insert(textArray, text4)
        text4:createMathBox()
        text4:move(width*0.01, height*0.4)
        text4:resize(width*0.98,height*0.25)
        text4:setText("\\0el {h=a*sin(A)=((c)/(2))*tan(A)}")
        text4:setReadOnly(true)
        
        text5 = D2Editor.newRichText()
        table.insert(textArray, text5)
        text5:createMathBox()
        text5:move(width*0.01, height*0.60)
        text5:resize(width*0.98,height*0.25)
        text5:setText("\\0el {c^(2)=4(a^(2)+h^(2))=4(1+sin^(2)(A))*a^(2)}")
        text5:setReadOnly(true)
        
        text6 = D2Editor.newRichText()
        table.insert(textArray, text6)
        text6:createMathBox()
        text6:move(width*0.01, height*0.75)
        text6:resize(width*0.98,height*0.25)
        text6:setText("\\0el {K=((1)/(2))*c*h=((1)/(4))*c^(2)*tan(A)}")
        text6:setReadOnly(true)
    end
    
    
    
    if displayMode == "notes_scalene" then
        text1 = D2Editor.newRichText()
        table.insert(textArray, text1)
        text1:createMathBox()
        text1:move(width*0.01, height*0.01)
        text1:resize(width*0.98,height*0.15)
        text1:setText("a,b,c=leg dimensions, h=altitude on side c")
        text1:setReadOnly(true)
        
        text2 = D2Editor.newRichText()
        table.insert(textArray, text2)
        text2:createMathBox()
        text2:move(width*0.01, height*0.15)
        text2:resize(width*0.98,height*0.15)
        text2:setText("A,B,C,C'=angles, K=area")
        text2:setReadOnly(true)
        
        text3 = D2Editor.newRichText()
        table.insert(textArray, text3)
        text3:createMathBox()
        text3:move(width*0.65, height*0.15)
        text3:resize(width*0.98,height*0.15)
        text3:setText("A+B+C=180°")
        text3:setReadOnly(true)
        
        text4 = D2Editor.newRichText()
        table.insert(textArray, text4)
        text4:createMathBox()
        text4:move(width*0.01, height*0.25)
        text4:resize(width*0.98,height*0.25)
        text4:setText("\\0el {K=((1)/(2))bc*sin(A)}")
        text4:setReadOnly(true)
        
        text5 = D2Editor.newRichText()
        table.insert(textArray, text5)
        text5:createMathBox()
        text5:move(width*0.65, height*0.25)
        text5:resize(width*0.98,height*0.25)
        text5:setText("\\0el {((2K)/(P))=r}")
        text5:setReadOnly(true)
        
        text6 = D2Editor.newRichText()
        table.insert(textArray, text6)
        text6:createMathBox()
        text6:move(width*0.01, height*0.45)
        text6:resize(width*0.98,height*0.25)
        text6:setText("\\0el {h=a*sin(B)=b*sin(A)}")
        text6:setReadOnly(true)
        
        text7 = D2Editor.newRichText()
        table.insert(textArray, text7)
        text7:createMathBox()
        text7:move(width*0.01, height*0.55)
        text7:resize(width*0.98,height*0.25)
        text7:setText("Sines: \\0el {((a)/(sin(A)))=((b)/(sin(B)))=((c)/(sin(C)))=((c)/(sin(C')))=2R}")
        text7:setReadOnly(true)
        
        text8 = D2Editor.newRichText()
        table.insert(textArray, text8)
        text8:createMathBox()
        text8:move(width*0.01, height*0.75)
        text8:resize(width*0.98,height*0.25)
        text8:setText("Cosines: \\0el {c^(2)=a^(2)+b^(2)-2ab*cos(C)=a^(2)+b^(2)-2ab*cos(C')}")
        text8:setReadOnly(true)
    end
    
    
    
    if displayMode == "notes_circleinscirctri" then
        text1 = D2Editor.newRichText()
        table.insert(textArray, text1)
        text1:createMathBox()
        text1:move(width*0.01, height*0.01)
        text1:resize(width*0.98,height*0.25)
        text1:setText("Equilateral:   \\0el {r=((a√(3))/(6))}    \\0el {R=((a√(3))/(3))}    \\0el {r=((R)/(2))}")
        text1:setReadOnly(true)
        
        text2 = D2Editor.newRichText()
        table.insert(textArray, text2)
        text2:createMathBox()
        text2:move(width*0.01, height*0.23)
        text2:resize(width*0.98,height*0.25)
        text2:setText("Right Tri:   \\0el {r=s-c=((a+b-c)/(2))}    \\0el {R=((c)/(2))}    \\0el {r=R(((a+b-c)/(c)))}")
        text2:setReadOnly(true)
        
        text3 = D2Editor.newRichText()
        table.insert(textArray, text3)
        text3:createMathBox()
        text3:move(width*0.01, height*0.43)
        text3:resize(width*0.98,height*0.27)
        text3:setText("\\0el {a,b=((2r+c)/(2))±((√(8c^(2)-4(2r+c)^(2)))/(4))}\n\\0el {b=((2r(a-r))/(a-2r))    c=(a-2r)+((2r(a-r))/(a-2r))=a+b-2r}")
        text3:setReadOnly(true)
        
        text4 = D2Editor.newRichText()
        table.insert(textArray, text4)
        text4:createMathBox()
        text4:move(width*0.01, height*0.66)
        text4:resize(width*0.98,height*0.28)
        text4:setText("Scalene: \\0el {K=√(s(s-a)(s-b)(s-c))}  \\0el {s=((1)/(2))(a+b+c)}")
        text4:setReadOnly(true)
        
        text5 = D2Editor.newRichText()
        table.insert(textArray, text5)
        text5:createMathBox()
        text5:move(width*0.01, height*0.85)
        text5:resize(width*0.98,height*0.27)
        text5:setText("\\0el {r=(s-c)*tan(((C)/(2)))=(((a+b-c))/(2))*tan(((C)/(2))) R=((abc)/(4K))   r=4R*sin(((A)/(2)))*sin(((B)/(2)))*sin(((C)/(2)))}")
        text5:setReadOnly(true)
    end
    
    
    
    if displayMode == "notes_scalingeq" then
        text1 = D2Editor.newRichText()
        table.insert(textArray, text1)
        text1:createMathBox()
        text1:move(width*0.01, height*0.01)
        text1:resize(width*0.98,height*0.27)
        text1:setText("\\0el {((L₂)/(L₁))=((h₂)/(h₁))}         \\0el {((A₂)/(A₁))=(((L₂)/(L₁)))^(2)}")
        text1:setReadOnly(true)
        
        text2 = D2Editor.newRichText()
        table.insert(textArray, text2)
        text2:createMathBox()
        text2:move(width*0.01, height*0.28)
        text2:resize(width*0.98,height*0.4)
        text2:setText("\\0el {((V₂)/(V₁))=(((L₂)/(L₁)))^(3)=(((A₂)/(A₁)))^(3/2)}")
        text2:setReadOnly(true)
    end
    
    
    if displayMode == "notes_inscribedpolygon" then
        text1 = D2Editor.newRichText()
        table.insert(textArray, text1)
        text1:createMathBox()
        text1:move(width*0.01, height*0.01)
        text1:resize(width*0.98,height*0.5)
        text1:setText("Regular Polygons\ns=side length of polygon\na=apothem (center to midpoint of side)\nR=circumcircle radius")
        text1:setReadOnly(true)
        
        text2 = D2Editor.newRichText()
        table.insert(textArray, text2)
        text2:createMathBox()
        text2:move(width*0.01, height*0.48)
        text2:resize(width*0.98,height*0.35)
        text2:setText("\\0el {a=((s)/(2*tan(((180)/(n)))))}")
        text2:setReadOnly(true)
        
        text3 = D2Editor.newRichText()
        table.insert(textArray, text3)
        text3:createMathBox()
        text3:move(width*0.351, height*0.51)
        text3:resize(width*0.98,height*0.25)
        text3:setText("\\0el {a=R*cos(((180)/(n)))}")
        text3:setReadOnly(true)
        
        text4 = D2Editor.newRichText()
        table.insert(textArray, text4)
        text4:createMathBox()
        text4:move(width*0.71, height*0.51)
        text4:resize(width*0.98,height*0.25)
        text4:setText("\\0el {area=((a*p)/(2))}")
        text4:setReadOnly(true)
        
        text5 = D2Editor.newRichText()
        table.insert(textArray, text5)
        text5:createMathBox()
        text5:move(width*0.71, height*0.751)
        text5:resize(width*0.98,height*0.25)
        text5:setText("\\0el {perimeter=n*s}")
        text5:setReadOnly(true)
    end
    
    
    if displayMode == "notes_powerpoint" then
        text1 = D2Editor.newRichText()
        table.insert(textArray, text1)
        text1:createMathBox()
        text1:move(width*0.01, height*0.01)
        text1:resize(width*0.98,height*0.33)
        text1:setText("Two chords intercepting at inner point E:  \\0el {AE*CE=BE*DE}")
        text1:setReadOnly(true)
        
        text2 = D2Editor.newRichText()
        table.insert(textArray, text2)
        text2:createMathBox()
        text2:move(width*0.01, height*0.34)
        text2:resize(width*0.98,height*0.33)
        text2:setText("One secant BD with chord CD connecting with one tangent AB:  \\0el {AB^(2)=BC*CD}")
        text2:setReadOnly(true)
        
        text3 = D2Editor.newRichText()
        table.insert(textArray, text3)
        text3:createMathBox()
        text3:move(width*0.01, height*0.67)
        text3:resize(width*0.98,height*0.33)
        text3:setText("Two secants AC and EC with chords AB and ED intercepting at outer point C:  \\0el {AB^(2)=BC*CD}")
        text3:setReadOnly(true)
    end
    
    
    if displayMode == "notes_intarcsangles" then
        text1 = D2Editor.newRichText()
        table.insert(textArray, text1)
        text1:createMathBox()
        text1:move(width*0.01, height*0.01)
        text1:resize(width*0.98,height*0.2)
        text1:setText("Two lines originating from center:  \\0el {θ=a}")
        text1:setReadOnly(true)
        
        text2 = D2Editor.newRichText()
        table.insert(textArray, text2)
        text2:createMathBox()
        text2:move(width*0.01, height*0.15)
        text2:resize(width*0.98,height*0.25)
        text2:setText("Two lines originating from edge:  \\0el {θ=((a)/(2))}")
        text2:setReadOnly(true)
        
        text3 = D2Editor.newRichText()
        table.insert(textArray, text3)
        text3:createMathBox()
        text3:move(width*0.01, height*0.4)
        text3:resize(width*0.98,height*0.33)
        text3:setText("Two arcs formed by two intersecting chords:  \\0el {θ=((a+b)/(2))}")
        text3:setReadOnly(true)
        
        text4 = D2Editor.newRichText()
        table.insert(textArray, text4)
        text4:createMathBox()
        text4:move(width*0.01, height*0.7)
        text4:resize(width*0.98,height*0.33)
        text4:setText("Two arcs formed by two secant lines intersecting at endpoints:  \\0el {θ=((b-a)/(2))}")
        text4:setReadOnly(true)
    end
    
    
    if displayMode == "notes_segmentssectors" then
        text1 = D2Editor.newRichText()
        table.insert(textArray, text1)
        text1:createMathBox()
        text1:move(width*0.01, height*0.01)
        text1:resize(width*0.98,height*0.2)
        text1:setText("R=radius, K=area, c=chord")
        text1:setReadOnly(true)
        
        text2 = D2Editor.newRichText()
        table.insert(textArray, text2)
        text2:createMathBox()
        text2:move(width*0.01, height*0.15)
        text2:resize(width*0.98,height*0.25)
        text2:setText("\\0el {c=2R*sin(((θ)/(2)))}")
        text2:setReadOnly(true)
        
        text3 = D2Editor.newRichText()
        table.insert(textArray, text3)
        text3:createMathBox()
        text3:move(width*0.01, height*0.4)
        text3:resize(width*0.98,height*0.33)
        text3:setText("\\0el {K(segment)=((1)/(2))R^(2)(θ-sin(θ)) (radian only)}")
        text3:setReadOnly(true)
        
        text4 = D2Editor.newRichText()
        table.insert(textArray, text4)
        text4:createMathBox()
        text4:move(width*0.01, height*0.7)
        text4:resize(width*0.98,height*0.33)
        text4:setText("\\0el {K(sector)=((1)/(2))R^(2)θ (radian only)}")
        text4:setReadOnly(true)
    end
    
    
    if displayMode == "notes_hemisphere" then
        text1 = D2Editor.newRichText()
        table.insert(textArray, text1)
        text1:createMathBox()
        text1:move(width*0.01, height*0.01)
        text1:resize(width*0.98,height*0.23)
        text1:setText("\\0el {Hemisphere: S=2πR^(2)=((π)/(2))D^(2)}")
        text1:setReadOnly(true)
        
        text2 = D2Editor.newRichText()
        table.insert(textArray, text2)
        text2:createMathBox()
        text2:move(width*0.01, height*0.23)
        text2:resize(width*0.98,height*0.23)
        text2:setText("\\0el {Hemisphere: T=3πR^(2)=((3π)/(4))D^(2)}")
        text2:setReadOnly(true)
        
        text3 = D2Editor.newRichText()
        table.insert(textArray, text3)
        text3:createMathBox()
        text3:move(width*0.01, height*0.46)
        text3:resize(width*0.98,height*0.23)
        text3:setText("\\0el {Hemisphere: V=((2)/(3))πR^(3)=((1)/(12))πD^(3)}")
        text3:setReadOnly(true)
        
        text4 = D2Editor.newRichText()
        table.insert(textArray, text4)
        text4:createMathBox()
        text4:move(width*0.01, height*0.67)
        text4:resize(width*0.98,height*0.15)
        text4:setText("\\0el {Sphere: S=4πR^(2)=πD^(2)}")
        text4:setReadOnly(true)
        
        text5 = D2Editor.newRichText()
        table.insert(textArray, text5)
        text5:createMathBox()
        text5:move(width*0.01, height*0.8)
        text5:resize(width*0.98,height*0.23)
        text5:setText("\\0el {Sphere: V=((4)/(3))πR^(3)=((1)/(6))πD^(3)}")
        text5:setReadOnly(true)
    end
    
    
    if displayMode == "notes_cylinders" then
        text1 = D2Editor.newRichText()
        table.insert(textArray, text1)
        text1:createMathBox()
        text1:move(width*0.01, height*0.01)
        text1:resize(width*0.98,height*0.35)
        text1:setText("Right Circular Cylinders:\n\\0el {S=2πRh  T=2πR(R+h)  V=πR^(2)h}")
        text1:setReadOnly(true)
        
        text2 = D2Editor.newRichText()
        table.insert(textArray, text2)
        text2:createMathBox()
        text2:move(width*0.01, height*0.4)
        text2:resize(width*0.98,height*0.35)
        text2:setText("Slant/Right Cylinders of Any Shape:\n\\0el {S=sC=((hC)/(sin(θ)))   A=A'*sin(θ)  V=hA'=sA")
        text2:setReadOnly(true)
    end
    
    
    if displayMode == "notes_conespyramids" then
        text1 = D2Editor.newRichText()
        table.insert(textArray, text1)
        text1:createMathBox()
        text1:move(width*0.01, height*0.01)
        text1:resize(width*0.98,height*0.6)
        text1:setText("Square-Base Pyramid:\n\\0el {h=((a*tan(α))/(√(2)))  s=((h)/(sin(α)))=((a)/(√(2)*cos(α)))   S=((a^(2))/(cos(α)))*√(1+sin^(2)(α))   T=S+a^(2)   V=((a^(2)h)/(3))")
        text1:setReadOnly(true)
        
        text2 = D2Editor.newRichText()
        table.insert(textArray, text2)
        text2:createMathBox()
        text2:move(width*0.01, height*0.61)
        text2:resize(width*0.98,height*0.39)
        text2:setText("Right Circular Cone:\n\\0el {s=√(R^(2)+h^(2))=((h)/(cos(θ)))=((R)/(sin(θ)))   S=πRs   T=πR(R+s)   V=((π)/(3))R^(2)h}")
        text2:setReadOnly(true)
    end
    
    
    if displayMode == "notes_frustumrightcirccone" then
        text1 = D2Editor.newRichText()
        table.insert(textArray, text1)
        text1:createMathBox()
        text1:move(width*0.01, height*0.01)
        text1:resize(width*0.98,height*0.25)
        text1:setText("\\0el {s=√((R₁-R₂)^(2)+h^(2))  =((h)/(cos(θ)))   =((R₁-R₂)/(sin(θ)))}")
        text1:setReadOnly(true)
        
        text2 = D2Editor.newRichText()
        table.insert(textArray, text2)
        text2:createMathBox()
        text2:move(width*0.01, height*0.25)
        text2:resize(width*0.98,height*0.25)
        text2:setText("\\0el {S=π(R₁+R₂)s  T=π[R₁^(2)+R₂^(2)+(R₁+R₂)s]}")
        text2:setReadOnly(true)
        
        text3 = D2Editor.newRichText()
        table.insert(textArray, text3)
        text3:createMathBox()
        text3:move(width*0.01, height*0.41)
        text3:resize(width*0.98,height*0.25)
        text3:setText("\\0el {V=((1)/(3))πh(R₁^(2)+R₂^(2)+R₁*R₂)}")
        text3:setReadOnly(true)
        
        text4 = D2Editor.newRichText()
        table.insert(textArray, text4)
        text4:createMathBox()
        text4:move(width*0.01, height*0.65)
        text4:resize(width*0.98,height*0.35)
        text4:setText("R1 = radius of lower base (bigger radius)\nR2 = radius of upper base (smaller radius)\ns = slant height\nh = altitude / height\nθ = semicone angle (half of angle at the tip)\nS = lateral surface area\nT = total surface area\nV = volume")
        text4:setReadOnly(true)
    end
    
    
    if displayMode == "notes_solidsrev" then
        text1 = D2Editor.newRichText()
        table.insert(textArray, text1)
        text1:createMathBox()
        text1:move(width*0.01, height*0.01)
        text1:resize(width*0.98,height*0.5)
        text1:setText("Parallel to x-axis (y=b, Disc Method):\n\\0el {V=π∫({[f(x)-b]^(2)-[g(x)-b]^(2)},x,x₀,x₁)}")
        text1:setReadOnly(true)
        
        text2 = D2Editor.newRichText()
        table.insert(textArray, text2)
        text2:createMathBox()
        text2:move(width*0.01, height*0.5)
        text2:resize(width*0.98,height*0.5)
        text2:setText("Parallel to y-axis (x=a, Shell Method):\n\\0el {V=2π ∫((x-a){f(x)-g(x)},x,x₀,x₁)}")
        text2:setReadOnly(true)
    end
    
    
    if displayMode == "notes_rectsquares" then
        text1 = D2Editor.newRichText()
        table.insert(textArray, text1)
        text1:createMathBox()
        text1:move(width*0.01, height*0.01)
        text1:resize(width*0.98,height*0.3)
        text1:setText("a,b=side dimensions, p=perimeter, d=diagonal, K=area, All internal angles = 90°")
        text1:setReadOnly(true)
        
        text2 = D2Editor.newRichText()
        table.insert(textArray, text2)
        text2:createMathBox()
        text2:move(width*0.01, height*0.35)
        text2:resize(width*0.98,height*0.3)
        text2:setText("Rectangles:\n\\0el {a≠b  d=√(a^(2)+b^(2))  p=2(a+b)  K=ab}")
        text2:setReadOnly(true)
        
        text3 = D2Editor.newRichText()
        table.insert(textArray, text3)
        text3:createMathBox()
        text3:move(width*0.01, height*0.7)
        text3:resize(width*0.98,height*0.3)
        text3:setText("Square:\n\\0el {a=b  d=a√(2)  p=4a  K=a^(2)}")
        text3:setReadOnly(true)
    end
    
    
    if displayMode == "notes_trapezoids" then
        text1 = D2Editor.newRichText()
        table.insert(textArray, text1)
        text1:createMathBox()
        text1:move(width*0.01, height*0.01)
        text1:resize(width*0.98,height*0.3)
        text1:setText("a,b,s,t=side dimensions, a and b are parallel, h=altitude on side a, K=area")
        text1:setReadOnly(true)
        
        text2 = D2Editor.newRichText()
        table.insert(textArray, text2)
        text2:createMathBox()
        text2:move(width*0.01, height*0.35)
        text2:resize(width*0.98,height*0.3)
        text2:setText("\\0el {h=s*sin(A)      h=t*sin(B)}")
        text2:setReadOnly(true)
        
        text3 = D2Editor.newRichText()
        table.insert(textArray, text3)
        text3:createMathBox()
        text3:move(width*0.01, height*0.7)
        text3:resize(width*0.98,height*0.3)
        text3:setText("\\0el {K=((1)/(2))(a+b)*h}")
        text3:setReadOnly(true)
    end
    
    
    if displayMode == "notes_rhombusparallelogram" then
        text1 = D2Editor.newRichText()
        table.insert(textArray, text1)
        text1:createMathBox()
        text1:move(width*0.01, height*0.01)
        text1:resize(width*0.98,height*0.4)
        text1:setText("a,b=side dimensions, p=perimeter, c,d=diagonals,h=altitude on side a, K=area, A,B,C,D=interior angles")
        text1:setReadOnly(true)
        
        text2 = D2Editor.newRichText()
        table.insert(textArray, text2)
        text2:createMathBox()
        text2:move(width*0.01, height*0.4)
        text2:resize(width*0.98,height*0.3)
        text2:setText("Parallelogram: \\0el {A=C, B=D, a≠b    A+B=180°  c=√(a^(2)+b^(2)-2ab*cos(A))=√(a^(2)+b^(2)+2ab*cos(B))  d=√(a^(2)+b^(2)+2ab*cos(A))=√(a^(2)+b^(2)-2ab*cos(B))  p=2(a+b)   h=b*sin(A)=b*sin(B)  K=ah=ab*sin(A)=ab*sin(B)}")
        text2:setReadOnly(true)
        
        text3 = D2Editor.newRichText()
        table.insert(textArray, text3)
        text3:createMathBox()
        text3:move(width*0.01, height*0.7)
        text3:resize(width*0.98,height*0.3)
        text3:setText("Rhombus: \\0el {A=C, B=D, a=b    A+B=180°  c=a√(2(1-cos(A)))=a√(2(1+cos(B)))  d=a√(2(1+cos(A)))=a√(2(1-cos(B)))  p=4a    h=b*sin(A)=b*sin(B)  K=ah=ab*sin(A)=ab*sin(B)}")
        text3:setReadOnly(true)
    end
    
    
    if displayMode == "notes_distpointline" then
        text1 = D2Editor.newRichText()
        table.insert(textArray, text1)
        text1:createMathBox()
        text1:move(width*0.01, height*0.01)
        text1:resize(width*0.98,height*0.99)
        text1:setText("\\0el {d=((abs(ax+by+c))/(√(a^(2)+b^(2))))    with point (x,y) and line ax+by+c=0    Line MUST be in General Form!    CAN use in 3D! d=((abs(ax+by+cz+d))/(√(a^(2)+b^(2)+c^(2))))    with point (x,y,z) and line ax+by+cz+d=0}")
        text1:setReadOnly(true)
    end
    
    
    if displayMode == "notes_compoundinterest" then
        text1 = D2Editor.newRichText()
        table.insert(textArray, text1)
        text1:createMathBox()
        text1:move(width*0.01, height*0.01)
        text1:resize(width*0.98,height*0.15)
        text1:setText("Simple Interest: \\0el {A=P(1+i)^(n)}")
        text1:setReadOnly(true)
        
        text2 = D2Editor.newRichText()
        table.insert(textArray, text2)
        text2:createMathBox()
        text2:move(width*0.01, height*0.15)
        text2:resize(width*0.98,height*0.25)
        text2:setText("Compound Interest: \\0el {A=P(1+((i)/(q)))^(nq)}")
        text2:setReadOnly(true)
        
        text3 = D2Editor.newRichText()
        table.insert(textArray, text3)
        text3:createMathBox()
        text3:move(width*0.01, height*0.4)
        text3:resize(width*0.98,height*0.4)
        text3:setText("Exponential: \\0el {A=P[((Ao)/(Po))]^(t/to)=P^(t/τ)}")
        text3:setReadOnly(true)
        
        text4 = D2Editor.newRichText()
        table.insert(textArray, text4)
        text4:createMathBox()
        text4:move(width*0.65, height*0.65)
        text4:resize(width*0.98,height*0.4)
        text4:setText("where \\0el {τ=((to)/(ln(((Ao)/(Po)))))}")
        text4:setReadOnly(true)
    end
    
    
    if displayMode == "notes_rates" then
        text1 = D2Editor.newRichText()
        table.insert(textArray, text1)
        text1:createMathBox()
        text1:move(width*0.01, height*0.01)
        text1:resize(width*0.98,height*0.25)
        text1:setText("\\0el {d=rt   therefore   r=((d)/(t))}")
        text1:setReadOnly(true)
        
        text2 = D2Editor.newRichText()
        table.insert(textArray, text2)
        text2:createMathBox()
        text2:move(width*0.01, height*0.25)
        text2:resize(width*0.98,height*0.15)
        text2:setText("Avg. rate of each worker is harmonic mean")
        text2:setReadOnly(true)
        
        text3 = D2Editor.newRichText()
        table.insert(textArray, text3)
        text3:createMathBox()
        text3:move(width*0.01, height*0.4)
        text3:resize(width*0.98,height*0.4)
        text3:setText("\\0el {r=((n)/(((1)/(r₁))+((1)/(r₂))+...+((1)/(r))))     t=((1)/(r)) if dis one task}")
        text3:setReadOnly(true)
        
        text4 = D2Editor.newRichText()
        table.insert(textArray, text4)
        text4:createMathBox()
        text4:move(width*0.01, height*0.8)
        text4:resize(width*0.98,height*0.3)
        text4:setText("\\0el {((1)/(t₁))+((1)/(t₂))=((1)/(t))}")
        text4:setReadOnly(true)
    end
    
    
    if displayMode == "notes_percent" then
        text1 = D2Editor.newRichText()
        table.insert(textArray, text1)
        text1:createMathBox()
        text1:move(width*0.01, height*0.01)
        text1:resize(width*0.98,height*0.25)
        text1:setText("\\0el {% Difference/Change = 100[((Number2-Number1)/(Number1))]}")
        text1:setReadOnly(true)
        
        text2 = D2Editor.newRichText()
        table.insert(textArray, text2)
        text2:createMathBox()
        text2:move(width*0.01, height*0.25)
        text2:resize(width*0.98,height*0.25)
        text2:setText("\\0el {% Error = 100[((Aprox-Exact)/(Exact))]}")
        text2:setReadOnly(true)
        
        text3 = D2Editor.newRichText()
        table.insert(textArray, text3)
        text3:createMathBox()
        text3:move(width*0.01, height*0.5)
        text3:resize(width*0.98,height*0.25)
        text3:setText("\\0el {% Increase = 100[((Large-Small)/(Small))] (always +)}")
        text3:setReadOnly(true)
        
        text4 = D2Editor.newRichText()
        table.insert(textArray, text4)
        text4:createMathBox()
        text4:move(width*0.01, height*0.75)
        text4:resize(width*0.98,height*0.25)
        text4:setText("\\0el {% Decrease = 100[((Large-Small)/(Large))] (always +)}")
        text4:setReadOnly(true)
    end
    
    
    if displayMode == "notes_physics" then
        text1 = D2Editor.newRichText()
        table.insert(textArray, text1)
        text1:createMathBox()
        text1:move(width*0.01, height*0.01)
        text1:resize(width*0.98,height*0.99)
        text1:setText("\\0el {Acceleration Equations  v=v+a(t-t)    d=d+v(t-t)+((1)/(2))a(t-t)^(2)         Trajectory Equations  d=((-v^(2)*sin(2θ))/(g))    d=((-v^(2)*sin^(2)(θ))/(2g))  v=√((((-g)/(8d)))(d^(2)+16d^(2)))  tan θ=((4d)/(d))        t=((-2vsin(θ))/(g))             Unequal Elevations  d=vt*cos(θ)       t=((d)/(v*cos(θ)))  d=d+vt*sin(θ)+((1)/(2))gt^(2)  d=d+d*tan(θ)+((g*d^(2))/(2v^(2)*cos^(2)(θ)))}")
        text1:setReadOnly(true)
    end
    
    
    if displayMode == "notes_conversions" then
        text1 = D2Editor.newRichText()
        table.insert(textArray, text1)
        text1:createMathBox()
        text1:move(width*0.01, height*0.01)
        text1:resize(width*0.98,height*0.99)
        text1:setText("1 year ≈ 365.256 days\n1 inch (in) = 2.54 centimeters (cm)\n1 mile (mi) = 5,280 feet (ft)\n1 square mile (sq.mi., mi^(2)) = 640 acres\n1 teaspoon (tsp) = \\0el {1/6} ounce (liquid,oz)\n1 tablespoon (tbs) = 0.5 ounce (liquid, oz)\n1 cup = 8 ounces (liquid, oz)\n1 pint (pt) = 16 ounces (liquid, oz)\n1 quart (qt) = 32 ounces (liquid, oz)\n1 half gallon = 64 ounces (liquid, oz)\n1 gallon (gal) = 128 ounces (liquid, oz)\n1 cubic foot (ft^(3)) ≈ 7.481 gallons (gal)\n1 liter (l) ≈ 1.0567 quarts (qt)\n1 pound (avdp, lb) = 16 ounces (avdp, oz)\n1 pound (lb) ≈ 453.592 grams (g)\n1 ton = 2000 pounds (lb)\n1 revolution (rev) = 360 degrees (deg, °)\nπ radians (rad) = 180 degrees (deg, °)\n1 degree (deg, °) = 60 minutes (') [angle]\n1 minute (') = 60 seconds ('') [angle]\n°C=5(°F-32)/9 ≈ K - 273.15, where °C = Degrees Centigrade/Celsius, °F = Degrees Fahrenheit, K = Kelvins\nMetric System Prefixes: \nnano (n,10^(-9))\nmicro (μ,10^(-6))\nmilli (m,10^(-3))\ncenti (c,10^(-2))\ndeci (d,10^(-1))\nhecto (h,100)\nkilo (k,10^(3))\nmega (M,10^(6))\nMonths of the Year: \nJanuary (31)\nFebruary (28*)\nMarch (31)\nApril (30)\nMay (31)\nJune (30)\nJuly (31)\nAugust (31)\nSeptember (30)\nOctober (31)\nNovember (30)\nDecember (31)   \n*: February has 29 days on leap years (divisible by 4 and not divisible by 100)    \nFun Facts:    \nLength of football field (without end zones) = 100 yards (yd)    \nA deck of cards has 52 cards, 13 each of spades, hearts, diamonds, and clubs. Sometimes 2 jokers are added.    \nDensity(water) = 1 gram/cubic centimeter (g/cc, g/cm^(3))    \ng = acceleration on earth ≈ -32.174 ft/s^(2)    \nRadius of Earth ≈ 3960 miles    \nMass of Earth ≈ 5.98×10^(24) kg    \n1+x+x^(2)+x^(3)+x^(4)+x^(5)+...=(1-x)^(-1)    \n(x^(2)<1)")
        text1:setReadOnly(true)
    end
    
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
