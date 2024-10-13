import bpy
import math





# these are the variables that you need to change
# this is the path where the renders go
path_for_stuff = "C:\Users\user\Pictures\blender"
# this is the degree shift for the sun
degrees = 15
sprite_name = "Cube"
light_name = "Light"



# not completely sure that this works
bpy.context.scene.render.resolution_x = 50
bpy.context.scene.render.resolution_y = 50
bpy.context.scene.render.resolution_percentage = 100
bpy.context.scene.render.filepath = path_for_stuff
bpy.context.scene.render.film_transparent = True
bpy.context.scene.render.engine = "CYCLES"

sprite_model = bpy.data.objects.get(sprite_name)
light = bpy.data.objects.get(light_name)
bpy.context.view_layer.objects.active = light
light.select_set(True)
bpy.ops.transform.rotate(
    value=-0.785398,
    orient_axis="Z",
    orient_type="GLOBAL",
    orient_matrix=((1, 0, 0), (0, 1, 0), (0, 0, 1)),
    orient_matrix_type="GLOBAL",
    constraint_axis=(False, False, True),
    mirror=False,
    use_proportional_edit=False,
    proportional_edit_falloff="SMOOTH",
    proportional_size=1,
    use_proportional_connected=False,
    use_proportional_projected=False,
    snap=False,
    snap_elements={"INCREMENT"},
    use_snap_project=False,
    snap_target="CLOSEST",
    use_snap_self=True,
    use_snap_edit=True,
    use_snap_nonedit=True,
    use_snap_selectable=False,
    release_confirm=True,
)
steps = (int)(180 / degrees)
stepSize = math.radians(degrees)
for i in range(0, steps):
    bpy.ops.transform.rotate(
        value=(stepSize * i),
        orient_axis="X",
        orient_type="GLOBAL",
        orient_matrix=((1, 0, 0), (0, 1, 0), (0, 0, 1)),
        orient_matrix_type="GLOBAL",
        constraint_axis=(True, False, False),
        mirror=False,
        use_proportional_edit=False,
        proportional_edit_falloff="SMOOTH",
        proportional_size=1,
        use_proportional_connected=False,
        use_proportional_projected=False,
        snap=False,
        snap_elements={"INCREMENT"},
        use_snap_project=False,
        snap_target="CLOSEST",
        use_snap_self=True,
        use_snap_edit=True,
        use_snap_nonedit=True,
        use_snap_selectable=False,
        release_confirm=True,
    )
    bpy.ops.transform.rotate(
        value=(stepSize * i),
        orient_axis="Y",
        orient_type="GLOBAL",
        orient_matrix=((1, 0, 0), (0, 1, 0), (0, 0, 1)),
        orient_matrix_type="GLOBAL",
        constraint_axis=(False, True, False),
        mirror=False,
        use_proportional_edit=False,
        proportional_edit_falloff="SMOOTH",
        proportional_size=1,
        use_proportional_connected=False,
        use_proportional_projected=False,
        snap=False,
        snap_elements={"INCREMENT"},
        use_snap_project=False,
        snap_target="CLOSEST",
        use_snap_self=True,
        use_snap_edit=True,
        use_snap_nonedit=True,
        use_snap_selectable=False,
        release_confirm=True,
    )
    for j in range(23):
        sprite_model.rotation_euler[2] = math.radians(15 * j)
        bpy.ops.render.render(write_still=True)
# end for