class DescriptionMethods
    if row['Variant5'].nil? 
        def DescMeth5(desc1, desc2, var1, var2, var3, var4)
            return "<p>" + desc1 + "</p><p>" + desc2 + "</p><p>" + var1 + "</p><p>" + var2 +
            "</p><p>" + var3 + "</p><p>" + var4
        end
    elseif row['Variant4'].nil? 
        def DescMeth4(desc1, desc2, var1, var2, var3)
            return "<p>" + desc1 + "</p><p>" + desc2 + "</p><p>" + var1 + "</p><p>" + var2 +
            "</p><p>" + var3 + "</p>"
        end
    elseif row['Variant3'].nil? 
        def DescMeth3(desc1, desc2, var1, var2)
            return "<p>" + desc1 + "</p><p>" + desc2 + "</p><p>" + var1 + "</p><p>" + var2 +
            "</p>"
        end
    elseif row['Variant2'].nil? 
        def DescMeth2(desc1, desc2, var1)
            return "<p>" + desc1 + "</p><p>" + desc2 + "</p><p>" + var1 + "</p>"
        end
    elseif row['Variant1'].nil? 
        def DescMeth1(desc1, desc2)
            return "<p>" + desc1 + "</p><p>" + desc2 + "</p>"
        end
    end
end