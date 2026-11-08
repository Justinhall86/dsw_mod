{
	"type": "fx",
	"cullingRadius": 50,
	"children": [
		{
			"type": "polygon",
			"name": "Floor",
			"editorOnly": true,
			"locked": true,
			"scaleX": 100,
			"scaleY": 100,
			"scaleZ": 100,
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
			"scaleX": 2.4,
			"scaleY": 2.4,
			"scaleZ": 2.4,
			"children": [
				{
					"type": "object",
					"name": "Wensicia",
					"editorOnly": true,
					"children": [
						{
							"type": "model",
							"name": "Female01_ImperialWensicia",
							"source": "Character/Imperial/Wensicia/Female01_ImperialWensicia.fbx",
							"scaleX": 1.2,
							"scaleY": 1.2,
							"scaleZ": 1.2,
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent",
									"animation": "Anim/Female01/Wensicia/Anim_Female01_Wensicia_Idle.fbx"
								}
							]
						},
						{
							"type": "model",
							"name": "Gun_Landsraad",
							"source": "Character/Common/Landsraad/Weapon/Gun_Landsraad.fbx",
							"x": -0.37666,
							"y": -0.0232,
							"z": 0.06688,
							"scaleY": 1.0000000000000002,
							"scaleZ": 1.0000000000000002,
							"rotationZ": -90
						},
						{
							"type": "constraint",
							"name": "constraint",
							"object": "FXAnimation.FXRoot.Wensicia.Gun_Landsraad",
							"target": "FXAnimation.FXRoot.Wensicia.Female01_ImperialWensicia.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_lClavicleJ.B_lShoulderJ.B_lElbowJ.B_lWristJ.B_lPalmJ"
						}
					]
				},
				{
					"type": "object",
					"name": "AoE",
					"scaleX": 2.75,
					"scaleY": 2.75,
					"scaleZ": 2.75,
					"children": [
						{
							"type": "advancedDecal",
							"name": "advancedDecal_border",
							"enabled": false,
							"locked": true,
							"scaleX": 16.700000000000006,
							"scaleY": 16.700000000000006,
							"scaleZ": 20.000000000000004,
							"rotationZ": -52.27095572260783,
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
									"type": "shader",
									"name": "GradientMap",
									"source": "hrt.shader.GradientMap",
									"props": {
										"USE_ALPHA": true,
										"gradient": {
											"type": "gradient",
											"data": {
												"stops": [
													{
														"position": 0,
														"color": -8248204
													},
													{
														"position": 1,
														"color": -15991
													}
												],
												"resolution": 64,
												"isVertical": false,
												"interpolation": "Linear",
												"colorMode": 0
											}
										}
									}
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
											0.792156862745098,
											0.6352941176470588,
											0.47058823529411764
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
											1,
											0.9490196078431372,
											0.8274509803921568
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "amount",
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.25779842717708584,
													"value": 0.5,
													"mode": 2
												},
												{
													"time": 0.6745276791165088,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "advancedDecal_border",
							"locked": true,
							"scaleX": 17,
							"scaleY": 17,
							"scaleZ": 15,
							"rotationZ": -154.4541911445216,
							"albedoMap": "Fx/Alphas/T_UI_InnerGradient_nograd_512.png",
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
											"emissive": 0.5
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
									"type": "shader",
									"name": "GradientMap",
									"source": "hrt.shader.GradientMap",
									"props": {
										"USE_ALPHA": true,
										"gradient": {
											"type": "gradient",
											"data": {
												"stops": [
													{
														"position": 0,
														"color": -8248204
													},
													{
														"position": 1,
														"color": -15991
													}
												],
												"resolution": 64,
												"isVertical": false,
												"interpolation": "Linear",
												"colorMode": 0
											}
										}
									}
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
											1,
											0.9568627450980391,
											0.9019607843137255
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
						}
					]
				}
			]
		}
	]
}