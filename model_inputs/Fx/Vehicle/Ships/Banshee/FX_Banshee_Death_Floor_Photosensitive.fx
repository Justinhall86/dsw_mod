{
	"type": "fx",
	"duration": 15,
	"cullingRadius": 15,
	"children": [
		{
			"type": "polygon",
			"name": "Floor",
			"editorOnly": true,
			"locked": true,
			"scaleX": 50,
			"scaleY": 50,
			"scaleZ": 50,
			"kind": 0,
			"args": [
				0
			],
			"children": [
				{
					"type": "material",
					"name": "material",
					"props": {
						"PBR": {
							"mode": "PBR",
							"blend": "None",
							"shadows": true,
							"culling": "Back",
							"depthTest": "Less",
							"colorMask": 15,
							"enableStencil": false
						}
					},
					"diffuseMap": "Fx/Test/Map_Albedo_VFXTest.png"
				}
			]
		},
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "model",
					"name": "Banshee",
					"source": "Vehicle/Smuggler/Banshee/Banshee.fbx",
					"editorOnly": true,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"animation": "Anim/Banshee/Anim_Banshee_Death.fbx"
						}
					]
				},
				{
					"type": "object",
					"name": "DeathFloor",
					"x": -0.99476,
					"y": -0.6888,
					"scaleX": 0.9,
					"scaleY": 0.9,
					"scaleZ": 0.9,
					"children": [
						{
							"type": "subFX",
							"name": "FX_Explosion_Mid_Photosensitive",
							"source": "Fx/Explosion/FX_Explosion_Mid_Photosensitive.fx",
							"scaleX": 1.25,
							"scaleY": 1.25,
							"scaleZ": 1.25,
							"time": 0.405
						}
					]
				}
			]
		}
	]
}