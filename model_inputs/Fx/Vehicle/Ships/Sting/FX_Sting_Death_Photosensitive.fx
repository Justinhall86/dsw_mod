{
	"type": "fx",
	"duration": 2,
	"cullingRadius": 3,
	"blendFactor": 1,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "object",
					"name": "Death",
					"children": [
						{
							"type": "subFX",
							"name": "FX_Explosion_MidAir",
							"source": "Fx/Vehicle/Ships/FX_Explosion_MidAir_Photosensitive.fx",
							"x": 0.2471,
							"y": -9.85974,
							"z": 2.71483,
							"scaleX": 0.25,
							"scaleY": 0.25,
							"scaleZ": 0.25,
							"time": 0.405
						},
						{
							"type": "subFX",
							"name": "FX_Directional_Explosion_Low",
							"source": "Fx/Explosion/FX_Directional_Explosion_Low_Photosensitive.fx",
							"x": 0.64515,
							"y": -0.83032,
							"z": -0.00306,
							"rotationX": -4.4,
							"rotationY": -63.6,
							"rotationZ": -77.4,
							"time": -0.5
						}
					]
				},
				{
					"type": "model",
					"name": "Stingg",
					"source": "Vehicle/Harkonnen/Overlord/Sting.fbx",
					"editorOnly": true,
					"scaleX": 3.6,
					"scaleY": 3.6,
					"scaleZ": 3.6,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"animation": "Anim/Overlord/Anim_Sting_Death.fbx"
						}
					]
				},
				{
					"type": "light",
					"name": "light_0",
					"editorOnly": true,
					"y": 2.98887,
					"z": -5.95137,
					"power": 3.79,
					"range": 30,
					"size": 2.05,
					"zNear": 0.02
				},
				{
					"type": "constraint",
					"name": "constraint",
					"enabled": false,
					"object": "FXAnimation.FXRoot.Death",
					"target": "FXAnimation.FXRoot.Stingg.root.B_ROOT.B_Sting"
				}
			]
		}
	]
}