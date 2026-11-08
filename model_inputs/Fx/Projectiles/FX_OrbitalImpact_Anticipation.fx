{
	"type": "fx",
	"duration": 6,
	"cullingRadius": 15,
	"blendFactor": 1,
	"children": [
		{
			"type": "polygon",
			"name": "Floor",
			"editorOnly": true,
			"locked": true,
			"scaleX": 70,
			"scaleY": 70,
			"scaleZ": 70,
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
			"scaleX": 0.9,
			"scaleY": 0.9,
			"scaleZ": 0.9,
			"children": [
				{
					"type": "object",
					"name": "target",
					"scaleX": 0.3,
					"scaleY": 0.3,
					"scaleZ": 0.3,
					"children": [
						{
							"type": "advancedDecal",
							"name": "targetOK",
							"scaleX": 85,
							"scaleY": 85,
							"scaleZ": 42.5,
							"rotationZ": 90,
							"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
							"fadePower": 3,
							"emissive": 0.5,
							"renderMode": "BeforeTonemapping",
							"children": [
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": false,
										"onDecal": false,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 1,
										"vOffset": 1,
										"texture": "Fx/Alphas/T_Ping07.png"
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": 1.7563340679705517,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.25
													}
												},
												{
													"time": 2.8475269480544183,
													"value": 1,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.4166666666666667
													},
													"nextHandle": {
														"dv": -0.08333333333333326,
														"dt": 0.019125934256978616
													}
												},
												{
													"time": 2.948971064084099,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.024637662369386987
													},
													"nextHandle": {
														"dv": 0,
														"dt": -0.5
													}
												}
											]
										}
									]
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 0,
									"keys": [
										{
											"time": 1.7563340679705517,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0.00914089075238272,
												"dt": -0.5009074885978119
											},
											"nextHandle": {
												"dv": -0.008333333333333304,
												"dt": 0.44962891024828444
											}
										},
										{
											"time": 2.8745027883211316,
											"value": 0.6,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "shader",
							"name": "EnvColorMult",
							"source": "shaders/EnvColorMult.hx",
							"props": {
								"sandBlend": 0.5,
								"sandColorSet": false,
								"envBlend": 0.5,
								"envColorSet": false
							},
							"isInstance": true
						}
					]
				},
				{
					"type": "advancedDecal",
					"name": "advancedDecal",
					"scaleX": 45,
					"scaleY": 45,
					"scaleZ": 28.14,
					"albedoMap": "Fx/Alphas/T_circle2.png",
					"fadePower": 3,
					"fadeStart": 1,
					"renderMode": "BeforeTonemapping",
					"blendMode": 2,
					"children": [
						{
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"props": {
								"alpha": 0.9
							},
							"children": [
								{
									"type": "curve",
									"name": "alpha",
									"keyMode": 0,
									"keys": [
										{
											"time": 1.8818809429705534,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.25
											}
										},
										{
											"time": 2.910278972200448,
											"value": 1,
											"mode": 1,
											"prevHandle": {
												"dv": -0.033333333333333326,
												"dt": -0.1048122989528022
											},
											"nextHandle": {
												"dv": -0.08333333333333326,
												"dt": 0.019125934256978616
											}
										},
										{
											"time": 3.011723088230129,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.02463766236938684
											},
											"nextHandle": {
												"dv": 0,
												"dt": -0.5
											}
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
									1,
									0.3176470588235294,
									0.0784313725490196
								]
							},
							"children": [
								{
									"type": "curve",
									"name": "color.h",
									"keyMode": 0,
									"keys": [
										{
											"time": 2.323693327388023,
											"value": 0.13930609626009785,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.3333333333333333
											}
										},
										{
											"time": 2.8767769789921136,
											"value": 0.3174761806795115,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "color.s",
									"keyMode": 0,
									"keys": [
										{
											"time": 2.323693327388023,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.3333333333333333
											}
										},
										{
											"time": 2.8767769789921136,
											"value": 0.9822222222222223,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "color.l",
									"keys": [
										{
											"time": 2.323693327388023,
											"value": 0.42745098039215684,
											"mode": 2
										},
										{
											"time": 2.8767769789921136,
											"value": 0.5588235294117647,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "curve",
							"name": "scale",
							"keyMode": 0,
							"keys": [
								{
									"time": 1.7806309429705525,
									"value": 0.2,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.5
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.25
									}
								},
								{
									"time": 2.8500599129851034,
									"value": 1,
									"mode": 1,
									"prevHandle": {
										"dv": 0,
										"dt": -0.4166666666666667
									},
									"nextHandle": {
										"dv": -0.08333333333333326,
										"dt": 0.019125934256978616
									}
								},
								{
									"time": 2.9515040290147843,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.024637662369387286
									},
									"nextHandle": {
										"dv": 0,
										"dt": -0.5
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