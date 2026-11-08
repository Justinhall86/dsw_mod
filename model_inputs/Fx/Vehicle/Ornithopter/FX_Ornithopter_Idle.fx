{
	"type": "fx",
	"cullingRadius": 3,
	"children": [
		{
			"type": "polygon",
			"name": "Floor",
			"editorOnly": true,
			"z": -9.64,
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
					"type": "object",
					"name": "Anim",
					"scaleX": 2,
					"scaleY": 2,
					"scaleZ": 2,
					"children": [
						{
							"type": "object",
							"name": "Ornithopter",
							"editorOnly": true,
							"scaleX": 2,
							"scaleY": 2,
							"scaleZ": 2,
							"children": [
								{
									"type": "model",
									"name": "Vehicule_Ornithopter",
									"source": "Vehicle/Atreide/Ornithopter/Vehicle_Ornithopter.fbx",
									"editorOnly": true,
									"animation": "Anim/Ornithopter/Anim_Ornithopter_Idle.fbx"
								}
							]
						},
						{
							"type": "object",
							"name": "FLOORTRAIL",
							"z": -3.99,
							"children": [
								{
									"type": "trails",
									"name": "trails",
									"x": -1.10467,
									"y": 1.9,
									"z": 4.94,
									"startWidth": 0.15,
									"lifetime": 1.75,
									"uvRepeat": "EClamp",
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Add",
													"shadows": false,
													"culling": "None",
													"colorMask": 255,
													"depthTest": "LessEqual"
												}
											},
											"wrapRepeat": true,
											"diffuseMap": "Fx/Gradients/uGrad_inv.png"
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 0.5
											}
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.5,
												"sandColorSet": false,
												"envBlend": 0.7,
												"envColorSet": false
											},
											"isInstance": true
										},
										{
											"type": "curve",
											"name": "visibility",
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.9999999999999998,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.01,
													"value": 1,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "trails",
									"name": "trails",
									"x": -1.10467,
									"y": -1.9,
									"z": 4.94,
									"startWidth": 0.15,
									"lifetime": 1.75,
									"uvRepeat": "EClamp",
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Add",
													"shadows": false,
													"culling": "None",
													"colorMask": 255,
													"depthTest": "LessEqual"
												}
											},
											"wrapRepeat": true,
											"diffuseMap": "Fx/Gradients/uGrad_inv.png"
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 0.5
											}
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.5,
												"sandColorSet": false,
												"envBlend": 0.7,
												"envColorSet": false
											},
											"isInstance": true
										},
										{
											"type": "curve",
											"name": "visibility",
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.9999999999999998,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.01,
													"value": 1,
													"mode": 2
												}
											]
										}
									]
								}
							]
						}
					]
				}
			]
		}
	]
}