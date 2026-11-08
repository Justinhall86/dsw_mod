{
	"type": "fx",
	"cullingRadius": 3,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "object",
					"name": "DroneA",
					"children": [
						{
							"type": "model",
							"name": "DroneA",
							"source": "Vehicle/Atreide/DroneA/DroneA.fbx",
							"enabled": false,
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
									"name": "animEvent",
									"animation": "Anim/DroneA/Anim_DroneA_Run.fbx"
								}
							]
						},
						{
							"type": "object",
							"name": "Left",
							"x": -0.25,
							"z": 0.07,
							"scaleX": 0.22,
							"scaleY": 0.22,
							"scaleZ": 0.4,
							"rotationX": -90,
							"rotationY": -16.36,
							"children": [
								{
									"type": "model",
									"name": "ReactorHexagoneTube",
									"source": "Fx/Vehicle/Drones/ReactorHexagoneTube.fbx",
									"scaleZ": 1.25,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"culling": "None",
													"colorMask": 255,
													"emissive": 1.5
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 0.71,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/Gradient_Spotlight_02.png",
												"onDecal": false
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0,
													0.9019607843137255,
													1
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": false,
												"wrap": true,
												"progress": 0.69,
												"saturation": 0,
												"width": 0.86,
												"uvScaleX": 0.25,
												"uvScaleY": 0.25,
												"texture": "Fx/noise/perlin06.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													-0.75
												],
												"uvScaleSpeed": [
													0,
													0
												]
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "model",
									"name": "ReactorHexagone",
									"source": "Fx/Vehicle/Drones/ReactorHexagone.fbx",
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"culling": "None",
													"colorMask": 255,
													"depthTest": "Less",
													"emissive": 1.5
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": false,
												"wrap": true,
												"invert": true,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/circGrad05.jpg",
												"onDecal": false
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.2,
												"saturation": 0,
												"width": 0.36,
												"uvScaleX": 0.5,
												"uvScaleY": 0.5,
												"texture": "Fx/noise/perlin06.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													-0.5,
													0
												],
												"uvScaleSpeed": [
													0,
													0
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0,
													0.9019607843137255,
													1
												]
											},
											"isInstance": true
										}
									]
								}
							]
						}
					]
				}
			]
		},
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
		}
	]
}