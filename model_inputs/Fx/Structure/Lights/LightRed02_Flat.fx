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
					"scaleX": 0.32001438253299996,
					"scaleY": 0.32001438253299996,
					"scaleZ": 0.4571634036185714,
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
									"emissive": 1
								}
							},
							"diffuseMap": "Fx/Structure/Lights/circGrad01.png",
							"color": [
								1,
								0,
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
					"name": "DepthBlend",
					"source": "shaders/DepthBlend.hx",
					"enabled": false,
					"props": {
						"REVERSE": false,
						"range": 0.5,
						"power": 65.15
					},
					"isInstance": true
				}
			]
		}
	]
}