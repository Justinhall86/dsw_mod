{
	"type": "fx",
	"cullingRadius": 3,
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
					"type": "subFX",
					"name": "FX_Reactor",
					"source": "Fx/Vehicle/Common/FX_Reactor.fx",
					"y": -0.02,
					"z": -0.75,
					"rotationY": -89.99999999999999,
					"time": null,
					"loop": null
				},
				{
					"type": "object",
					"name": "DroneA",
					"editorOnly": true,
					"children": [
						{
							"type": "model",
							"name": "DroneA",
							"source": "Vehicle/Atreide/DroneA/DroneA.fbx",
							"editorOnly": true,
							"x": 0.31499999999999995,
							"y": 0.003333333333333334,
							"z": -2.338333333333333,
							"scaleX": 3.6,
							"scaleY": 3.6,
							"scaleZ": 3.6,
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent"
								}
							]
						}
					]
				}
			]
		}
	]
}