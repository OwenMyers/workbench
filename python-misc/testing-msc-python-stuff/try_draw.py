import Image, ImageDraw


def main():
    # lattice size
    l = 16
    
    out_file_name = "drawing.png"
    
    image_x_dim = 1200
    image_y_dim = 1200
    image_dims = (image_x_dim,image_y_dim)
    backround_color = "WHITE"
    
    # length of dimer
    dmr_l = float(image_x_dim)/float(l)
    # width of dimer
    dmr_w = float(image_x_dim)/float(l)/4.0
    

    hdx1 = .5*dmr_l
    hdx2 = hdx1 + dmr_l/4.0
    hdx3 = hdx1 + 3.0*dmr_l/4.0
    hdx4 = hdx1 + 4.0*dmr_l/4.0

    hdy1 = .5*dmr_l
    hdy2 = hdy1 + dmr_w/2.0
    hdy3 = hdy1 - dmr_w/2.0

    
    im = Image.new("RGB",image_dims,backround_color)
    draw = ImageDraw.Draw(im)
    #draw.line((0, 0) + im.size, fill=128)
    #draw.line((0, im.size[1], im.size[0], 0), fill=128)
    
    draw.polygon([(hdx1,hdy1),(hdx2,hdy2),(hdx3,hdy2),(hdx4,hdy1),(hdx3,hdy3),(hdx2,hdy3)],fill=128)
    
    del draw
    
    # write to stdout
    im.save(out_file_name, "PNG")

if __name__ == "__main__":
    main()
