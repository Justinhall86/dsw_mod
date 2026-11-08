{
	"type": "fx",
	"duration": 8,
	"cullingRadius": 1000,
	"blendFactor": 1,
	"children": [
		{
			"type": "polygon",
			"name": "Floor",
			"editorOnly": true,
			"locked": true,
			"scaleX": 500,
			"scaleY": 500,
			"scaleZ": 500,
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
							"mode": "BeforeTonemapping",
							"blend": "None",
							"shadows": true,
							"culling": "Back",
							"depthTest": "Less",
							"colorMask": 15,
							"enableStencil": false
						}
					},
					"diffuseMap": "Fx/Test/Map_Albedo_VFXTest.png",
					"refMatLib": ""
				}
			]
		},
		{
			"type": "object",
			"name": "FXRoot",
			"scaleX": 0.55,
			"scaleY": 0.55,
			"scaleZ": 0.55,
			"children": [
				{
					"type": "object",
					"name": "units",
					"scaleX": 1.5,
					"scaleY": 1.5,
					"scaleZ": 1.5,
					"children": [
						{
							"type": "model",
							"name": "suboid",
							"source": "Character/Vernius/Unit/Suboid/Male01_Suboid.fbx",
							"editorOnly": true,
							"scaleX": 2.2,
							"scaleY": 2.2,
							"scaleZ": 2.2,
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent",
									"enabled": false,
									"animation": "Anim/Siren/Anim_Siren_Run.fbx"
								},
								{
									"type": "material",
									"name": "material",
									"enabled": false,
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
									}
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"enabled": false,
									"props": {
										"amount": 1,
										"color": [
											1,
											0,
											0
										]
									}
								}
							]
						},
						{
							"type": "object",
							"name": "Appear",
							"children": [
								{
									"type": "object",
									"name": "Decal",
									"z": 2.31677,
									"children": [
										{
											"type": "advancedDecal",
											"name": "advancedDecal",
											"z": 0.49999999999999956,
											"scaleX": 8.8,
											"scaleY": 8.8,
											"scaleZ": 8.8,
											"albedoMap": "Fx/Gradients/circGrad05.jpg",
											"renderMode": "BeforeTonemapping",
											"children": [
												{
													"type": "material",
													"name": "material",
													"props": {
														"PBR": {
															"mode": "BeforeTonemapping",
															"blend": "Add",
															"shadows": false,
															"culling": "Back",
															"colorMask": 255,
															"emissive": 2
														}
													},
													"refMatLib": ""
												}
											]
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 0.5
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.369996675754097,
															"value": 0.75,
															"mode": 2
														},
														{
															"time": 2.40751582731311,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"enabled": false,
											"props": {
												"alpha": 0.5
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": 0.81029170480211,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.729976654374642,
															"value": 0.75,
															"mode": 2
														},
														{
															"time": 2.7674958059336547,
															"value": 0,
															"mode": 2
														}
													]
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
													0.6196078431372549,
													0.38823529411764707,
													0.8588235294117647
												]
											}
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