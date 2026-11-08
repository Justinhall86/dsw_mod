{
	"type": "fx",
	"duration": 3,
	"cullingRadius": 15,
	"children": [
		{
			"type": "polygon",
			"name": "Floor",
			"enabled": false,
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
			"scaleX": 1.28,
			"scaleY": 1.28,
			"scaleZ": 1.28,
			"children": [
				{
					"type": "object",
					"name": "Chara",
					"editorOnly": true,
					"scaleX": 2.2,
					"scaleY": 2.2,
					"scaleZ": 2.2,
					"children": [
						{
							"type": "model",
							"name": "DroneNuwa",
							"source": "Character/Vernius/Unit/Nuwa/DroneNuwa.fbx",
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent",
									"animation": "Anim/DroneNuwa/Anim_DroneNuwa_AttackRange.fbx"
								}
							]
						},
						{
							"type": "shader",
							"name": "ColorSet",
							"source": "shaders/ColorSet.hx",
							"props": {
								"amount": 1,
								"color": [
									0,
									0,
									0
								]
							}
						}
					]
				},
				{
					"type": "subFX",
					"name": "FX_Common_AttackRange",
					"source": "Fx/Unit/FX_Common_AttackRange.fx",
					"x": -1.96512,
					"y": -0.01821,
					"z": 5.42601,
					"scaleX": 0.5,
					"scaleY": 0.5,
					"scaleZ": 0.5,
					"rotationY": 10.5,
					"time": -0.1
				},
				{
					"type": "subFX",
					"name": "FX_Common_AttackRange",
					"source": "Fx/Unit/FX_Common_AttackRange.fx",
					"x": -0.61525,
					"y": -2.59843,
					"z": 3.75496,
					"scaleX": 0.5,
					"scaleY": 0.5,
					"scaleZ": 0.5,
					"rotationX": 1.5,
					"rotationY": 10.4,
					"rotationZ": 8.4,
					"time": -0.06
				},
				{
					"type": "subFX",
					"name": "FX_Common_AttackRange",
					"source": "Fx/Unit/FX_Common_AttackRange.fx",
					"x": -0.92267,
					"y": 2.7144,
					"z": 3.87355,
					"scaleX": 0.5,
					"scaleY": 0.5,
					"scaleZ": 0.5,
					"rotationX": 1.5,
					"rotationY": 4,
					"rotationZ": -8.3,
					"time": -0.02
				}
			]
		}
	]
}