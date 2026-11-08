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
					"name": "Hammer",
					"source": "Vehicle/Imperial/Hammer/Hammer.fbx",
					"editorOnly": true,
					"scaleX": 3.6,
					"scaleY": 3.6,
					"scaleZ": 3.6,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"animation": "Anim/Hawk/Anim_Hawk_Death.fbx"
						}
					]
				},
				{
					"type": "object",
					"name": "DeathFloor",
					"x": 3.16929,
					"y": -1.15301,
					"scaleX": 1.2,
					"scaleY": 1.2,
					"scaleZ": 1.2,
					"children": [
						{
							"type": "subFX",
							"name": "FX_Explosion_Mid_Photosensitive",
							"source": "Fx/Explosion/FX_Explosion_Mid_Photosensitive.fx",
							"x": 2.03968,
							"y": -0.6461,
							"scaleX": 1.25,
							"scaleY": 1.25,
							"scaleZ": 1.25,
							"time": 0.94112
						},
						{
							"type": "subFX",
							"name": "FX_LensFlare_MidExplosion",
							"source": "Fx/Explosion/FX_LensFlare_MidExplosion.fx",
							"enabled": false,
							"x": 2.03968,
							"y": 0.94916,
							"z": 3.8389,
							"scaleX": 2,
							"scaleY": 2,
							"scaleZ": 2,
							"time": 2.03135
						}
					]
				}
			]
		}
	]
}