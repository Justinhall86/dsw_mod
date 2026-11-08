{
	"type": "fx",
	"cullingRadius": 1000,
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
							"mode": "PBR",
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
			"scaleX": 0.3,
			"scaleY": 0.3,
			"scaleZ": 0.3,
			"children": [
				{
					"type": "model",
					"name": "FolderRelay",
					"source": "Vehicle/Vernius/FolderRelay/FolderRelay.fbx",
					"editorOnly": true,
					"z": -0.5,
					"scaleX": 4,
					"scaleY": 4,
					"scaleZ": 4,
					"rotationZ": -89.99999999999999,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"animation": "Anim/FolderRelay/Anim_FolderRelay_Skill.fbx"
						}
					]
				},
				{
					"type": "object",
					"name": "AoE",
					"scaleX": 25,
					"scaleY": 25,
					"scaleZ": 25,
					"children": [
						{
							"type": "advancedDecal",
							"name": "advancedDecal_border",
							"locked": true,
							"scaleX": 16.700000000000003,
							"scaleY": 16.700000000000003,
							"scaleZ": 5,
							"rotationZ": -52.27095572260782,
							"albedoMap": "Fx/Alphas/T_UI_InnerGradient_512.png",
							"emissive": 0.5,
							"renderMode": "BeforeTonemapping",
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "BeforeTonemapping",
											"blend": "Alpha",
											"shadows": false,
											"culling": "Front",
											"depthTest": "Greater",
											"colorMask": 15,
											"enableStencil": false,
											"alphaKill": false,
											"emissive": 1
										}
									},
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 1
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
													"time": 0.25779842717708584,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.6745276791165088,
													"value": 0.5,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "curve",
									"name": "rotation.z",
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 10,
											"value": 1,
											"mode": 2
										}
									],
									"loop": true
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.1843137254901961,
											0.07058823529411765,
											0.37254901960784315
										]
									}
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.6862745098039216,
											0.5411764705882353,
											0.8392156862745098
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "amount",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.050060820827633516,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.5510841998220848,
													"value": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3350000000000002
													},
													"nextHandle": {
														"dv": -1.8417475812501703e-16,
														"dt": 0.22558515433173873
													}
												}
											]
										}
									]
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "advancedDecal_var",
							"locked": true,
							"scaleX": 16.700000000000006,
							"scaleY": 16.700000000000006,
							"scaleZ": 5,
							"rotationZ": -142.67482395117338,
							"albedoMap": "Fx/Alphas/T_UI_InnerGradient_512_test.png",
							"emissive": 0.5,
							"renderMode": "BeforeTonemapping",
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "BeforeTonemapping",
											"blend": "Alpha",
											"shadows": false,
											"culling": "Front",
											"depthTest": "Greater",
											"colorMask": 15,
											"enableStencil": false,
											"alphaKill": false,
											"emissive": 2,
											"drawOrder": "100"
										}
									},
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
													"time": 0.25779842717708584,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.6745276791165088,
													"value": 0.5,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "curve",
									"name": "rotation.z",
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 50,
											"value": 1,
											"mode": 2
										}
									],
									"loop": true
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.1843137254901961,
											0.07058823529411765,
											0.37254901960784315
										]
									}
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 0.8,
										"color": [
											0.6862745098039216,
											0.5411764705882353,
											0.8392156862745098
										]
									}
								}
							]
						},
						{
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"props": {
								"alpha": 0.75
							}
						},
						{
							"type": "shader",
							"name": "AlphaCycle",
							"source": "shaders/AlphaCycle.hx",
							"enabled": false,
							"props": {
								"minAlpha": 0.5,
								"maxAlpha": 1,
								"frequency": 0.125
							}
						}
					]
				}
			]
		}
	]
}