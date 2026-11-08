{
	"type": "fx",
	"cullingRadius": 3,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "polygon",
					"name": "back horz flare",
					"scaleX": 0.26778862976232,
					"scaleY": 0.26778862976232,
					"scaleZ": 0.38255518537474287,
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
									"blend": "Add",
									"shadows": false,
									"depthTest": "Less",
									"colorMask": 15,
									"enableStencil": false,
									"emissive": 0.5
								}
							},
							"diffuseMap": "Fx/Structure/Lights/circGrad01.png",
							"color": [
								1,
								0.6274509803921569,
								0,
								1
							]
						},
						{
							"type": "curve",
							"name": "scale",
							"loop": true,
							"keys": [
								{
									"time": 0,
									"value": 1,
									"mode": 2
								},
								{
									"time": 0.09499999999999997,
									"value": 0.852770697317002,
									"mode": 2
								},
								{
									"time": 0.21499999999999997,
									"value": 1.1725805708828074,
									"mode": 2
								},
								{
									"time": 0.39,
									"value": 0.8704790306503354,
									"mode": 2
								},
								{
									"time": 0.5399999999999999,
									"value": 1.1954972375494741,
									"mode": 2
								},
								{
									"time": 0.72,
									"value": 0.8861040306503354,
									"mode": 2
								},
								{
									"time": 0.8649999999999999,
									"value": 1.1746639042161409,
									"mode": 2
								},
								{
									"time": 1.0550000000000002,
									"value": 0.852770697317002,
									"mode": 2
								},
								{
									"time": 1.2,
									"value": 1.204872237549474,
									"mode": 2
								},
								{
									"time": 1.4000000000000001,
									"value": 0.8579790306503353,
									"mode": 2
								},
								{
									"time": 1.57,
									"value": 1.1777889042161407,
									"mode": 2
								},
								{
									"time": 1.7000000000000002,
									"value": 0.8767290306503354,
									"mode": 2
								},
								{
									"time": 1.9,
									"value": 1.0208333333333333,
									"mode": 2
								},
								{
									"time": 2,
									"value": 1,
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
					"props": {
						"alpha": 1
					},
					"isInstance": true,
					"children": [
						{
							"type": "curve",
							"name": "alpha",
							"keyMode": 0,
							"loop": true,
							"keys": [
								{
									"time": 0,
									"value": 1,
									"mode": 2
								},
								{
									"time": 0.924196307640523,
									"value": 1,
									"mode": 0
								},
								{
									"time": 1.5,
									"value": 0,
									"mode": 0
								},
								{
									"time": 2,
									"value": 0,
									"mode": 0
								},
								{
									"time": 2.48291039986536,
									"value": 1,
									"mode": 0
								},
								{
									"time": 3.440870102378541,
									"value": 1,
									"mode": 0
								},
								{
									"time": 3.9442048613261447,
									"value": 0,
									"mode": 0
								},
								{
									"time": 4.4150664100190635,
									"value": 0,
									"mode": 0
								},
								{
									"time": 5,
									"value": 1,
									"mode": 0
								}
							]
						}
					]
				}
			]
		}
	]
}