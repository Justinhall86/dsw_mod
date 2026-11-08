{
	"type": "fx",
	"cullingRadius": 10000000000,
	"children": [
		{
			"type": "object",
			"name": "group",
			"editorOnly": true,
			"z": 0.1,
			"children": [
				{
					"type": "object",
					"name": "place here",
					"y": 2
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
							"time": 5,
							"value": 1,
							"mode": 2
						}
					]
				}
			]
		},
		{
			"type": "object",
			"name": "group",
			"z": 0.1,
			"children": [
				{
					"type": "emitter",
					"name": "emitter",
					"props": {
						"emitShape": "Box",
						"lifeTime": 45,
						"simulationSpace": "World",
						"maxCount": 50,
						"frameCount": 8,
						"frameDivisionX": 4,
						"frameDivisionY": 2,
						"animationSpeed": 0,
						"emitRate": 0.5,
						"spriteSheet": "Fx/Alphas/T_Tracks_3.png",
						"instStretch": [
							1.4,
							1,
							1
						]
					},
					"scaleX": 0.01,
					"scaleY": 0.19,
					"scaleZ": 0.01,
					"children": [
						{
							"type": "polygon",
							"name": "polygon",
							"scaleY": 1.2,
							"rotationZ": 90,
							"color": 100663295,
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
											"blend": "Alpha",
											"shadows": false,
											"culling": "None",
											"colorMask": 255,
											"alphaKill": false,
											"depthTest": "LessEqual",
											"drawOrder": "-100"
										}
									},
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
								},
								{
									"type": "shader",
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 0.7
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
											0.6,
											0.5607843137254902,
											0.615686274509804
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"props": {
										"sandBlend": 0.7,
										"sandColorSet": false,
										"envBlend": 0.7,
										"envColorSet": false
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 1
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.009032639559236166
													}
												},
												{
													"time": 0.6,
													"value": 0.8,
													"mode": 0,
													"prevHandle": {
														"dv": 0.18333333333333335,
														"dt": -0.1442815288997274
													},
													"nextHandle": {
														"dv": -0.16373470768286233,
														"dt": 0.12885760340963578
													}
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.08333333333333331,
														"dt": -0.24252197327643132
													},
													"nextHandle": {
														"dv": -0.046108156835641206,
														"dt": 0.13356284228781748
													}
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
					"type": "emitter",
					"name": "emitter",
					"enabled": false,
					"props": {
						"emitShape": "Box",
						"lifeTime": 45,
						"simulationSpace": "World",
						"maxCount": 50,
						"frameCount": 16,
						"frameDivisionX": 4,
						"frameDivisionY": 4,
						"animationSpeed": 0,
						"emitRate": 0.5,
						"spriteSheet": "Fx/Alphas/T_Tracks_4.png",
						"instStretch": [
							1.4,
							1,
							1
						]
					},
					"y": -0.04,
					"z": -0.01,
					"scaleX": 0.01,
					"scaleY": 0.19,
					"scaleZ": 0.01,
					"children": [
						{
							"type": "polygon",
							"name": "polygon",
							"scaleY": 1.2,
							"rotationZ": 90,
							"color": 100663295,
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
											"blend": "Alpha",
											"shadows": false,
											"culling": "None",
											"colorMask": 255,
											"alphaKill": false,
											"depthTest": "LessEqual",
											"drawOrder": "-100"
										}
									},
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
								},
								{
									"type": "shader",
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 0.4
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
											0.8274509803921568,
											0.8274509803921568,
											0.8274509803921568
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"props": {
										"sandBlend": 0.7,
										"sandColorSet": false,
										"envBlend": 0.7,
										"envColorSet": false
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 1
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.009032639559236166
													}
												},
												{
													"time": 0.6,
													"value": 0.8,
													"mode": 0,
													"prevHandle": {
														"dv": 0.18333333333333335,
														"dt": -0.1442815288997274
													},
													"nextHandle": {
														"dv": -0.16373470768286233,
														"dt": 0.12885760340963578
													}
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.08333333333333331,
														"dt": -0.24252197327643132
													},
													"nextHandle": {
														"dv": -0.046108156835641206,
														"dt": 0.13356284228781748
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
	]
}