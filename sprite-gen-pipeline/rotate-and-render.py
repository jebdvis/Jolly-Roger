import bpy
import math

def rotate_and_render(obj_name, degrees, path_for_stuff):

    bpy.context.scene.render.resolution_x = 50
    bpy.context.scene.render.resolution_y = 50
    bpy.context.scene.render.resolution_percentage = 100
    bpy.context.scene.render.filepath = path_for_stuff
    bpy.context.scene.render.film_transparent = True
    bpy.context.scene.render.engine = 'CYCLES'


    obj = bpy.data.objects.get(obj_name)
    obj.rotation_euler[2] = math.radians(degrees)
    bpy.ops.render.render(write_still=True)


for i in range(20):
    rotate_and_render('obj', 15*i, "path for thing")