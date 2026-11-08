{
	"type": "fx",
	"duration": 15,
	"cullingRadius": 80,
	"children": [
		{
			"type": "polygon",
			"name": "Floor",
			"editorOnly": true,
			"locked": true,
			"z": 0.08361,
			"scaleX": 200,
			"scaleY": 200,
			"scaleZ": 200,
			"rotationZ": 180,
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
			"y": 8.28646,
			"rotationZ": 15,
			"children": [
				{
					"type": "model",
					"name": "FolderRelay",
					"source": "Vehicle/Vernius/FolderRelay/FolderRelay.fbx",
					"editorOnly": true,
					"scaleX": 3,
					"scaleY": 3,
					"scaleZ": 3,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"animation": "Anim/FolderRelay/Anim_FolderRelay_Death.fbx"
						}
					]
				},
				{
					"type": "object",
					"name": "DeathFloor",
					"x": -3.12918,
					"y": -0.99359,
					"children": [
						{
							"type": "subFX",
							"name": "FX_DeathFloor_Dust_Directional",
							"source": "Fx/Vehicle/Ships/FX_DeathFloor_Dust_Directional.fx",
							"x": -15.65876,
							"y": -3.28578,
							"scaleX": 0.85,
							"scaleY": 0.85,
							"scaleZ": 0.85,
							"rotationZ": 25,
							"time": 1.53378
						},
						{
							"type": "subFX",
							"name": "FX_DeathFloor_Dust",
							"source": "Fx/Vehicle/Ships/FX_DeathFloor_Dust.fx",
							"x": -2.96282,
							"y": -0.9551,
							"scaleX": 0.75,
							"scaleY": 0.75,
							"scaleZ": 0.75,
							"rotationZ": 2.9,
							"time": 0.03332
						},
						{
							"type": "subFX",
							"name": "FX_DeathFinalExplosion_NoPhotosensitive",
							"source": "Fx/Vehicle/Ships/FX_DeathFinalExplosion.fx",
							"x": -0.17369,
							"y": 0.22745,
							"scaleX": 0.75,
							"scaleY": 0.75,
							"scaleZ": 0.75,
							"time": 3.94932
						},
						{
							"type": "object",
							"name": "group",
							"enabled": false,
							"z": 3,
							"rotationZ": 11.5,
							"children": [
								{
									"type": "model",
									"name": "Sphere",
									"source": "Fx/Meshes_Common/Sphere.fbx",
									"x": -32,
									"scaleX": 10,
									"scaleY": 10,
									"scaleZ": 10,
									"rotationX": 10.91
								}
							]
						}
					]
				}
			]
		}
	]
}