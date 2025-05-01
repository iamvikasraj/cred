//
//  moreView().swift
//  swiftui02
//
//  Created by Vikas Raj Yadav on 29/04/25.
//

import SwiftUI


struct more: View {
    var body: some View {
        ZStack {
            // Black background for the entire view
            Color.black
                .ignoresSafeArea() // This ignores all safe areas
            
            GeometryReader { geometry in
                VStack {
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(alignment: .trailing, spacing: 52) {
                                HStack(alignment: .bottom) {
                                    VStack(alignment: .leading, spacing: 13) {
                                        VStack(alignment: .leading, spacing: 10) {
                                            
                                        }
                                        .padding(0)
                                        .frame(width: 61, height: 16, alignment: .topLeading)
                                        .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                        
                                        VStack(alignment: .leading, spacing: 10) {
                                            
                                        }
                                        .padding(0)
                                        .frame(maxWidth: .infinity, minHeight: 26, maxHeight: 26, alignment: .topLeading)
                                        .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                    }
                                    .padding(0)
                                    .frame(width: 91, alignment: .topLeading)
                                    
                                    Spacer()
                                    
                                    HStack(alignment: .bottom, spacing: 10) {
                                        HStack(alignment: .center, spacing: 10) {
                                            
                                        }
                                        .padding(0)
                                        .frame(width: 40, height: 40, alignment: .leading)
                                        .background(.white)
                                        .cornerRadius(60)
                                        .overlay(
                                          RoundedRectangle(cornerRadius: 60)
                                            .inset(by: 0.25)
                                            .stroke(Color(red: 0.9, green: 0.9, blue: 0.9), lineWidth: 0.5)
                                        )
                                        
                                        HStack(alignment: .top, spacing: 10) {
                                            
                                        }
                                        .padding(10)
                                        .frame(width: 104, height: 41, alignment: .topLeading)
                                        .background(.white)
                                        .cornerRadius(60)
                                        .overlay(
                                          RoundedRectangle(cornerRadius: 60)
                                            .inset(by: 0.25)
                                            .stroke(Color(red: 0.9, green: 0.9, blue: 0.9), lineWidth: 0.5)
                                        )
                                    }
                                    .padding(0)
                                }
                                .padding(0)
                                .frame(maxWidth: .infinity, alignment: .bottomLeading)
                                
                                
                                //banner design for the card
                                VStack(alignment: .center, spacing: 60) {
                                    VStack(alignment: .leading, spacing: 20) {
                                        VStack(alignment: .leading, spacing: 10) {
                                            
                                        }
                                        .padding(0)
                                        .frame(width: 61, height: 8, alignment: .topLeading)
                                        .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                        
                                        HStack(alignment: .center) {
                                            VStack(alignment: .center, spacing: 11) {
                                                HStack(alignment: .center, spacing: 10) {
                                                    
                                                }
                                                .padding(0)
                                                .frame(maxWidth: .infinity, minHeight: 62, maxHeight: 62, alignment: .leading)
                                                .background(.white)
                                                .cornerRadius(60)
                                                .overlay(
                                                  RoundedRectangle(cornerRadius: 60)
                                                    .inset(by: 0.25)
                                                    .stroke(Color(red: 0.9, green: 0.9, blue: 0.9), lineWidth: 0.5)
                                                )
                                                
                                                VStack(alignment: .center, spacing: 3) {
                                                    VStack(alignment: .leading, spacing: 10) {
                                                        
                                                    }
                                                    .padding(0)
                                                    .frame(maxWidth: .infinity, minHeight: 12, maxHeight: 12, alignment: .topLeading)
                                                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                                    
                                                    VStack(alignment: .leading, spacing: 10) {
                                                        
                                                    }
                                                    .padding(0)
                                                    .frame(width: 31, height: 12, alignment: .topLeading)
                                                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                                    
                                                }
                                                .padding(0)
                                                .frame(maxWidth: .infinity, alignment: .top)
                                            }
                                            .padding(0)
                                            .frame(width: 62, alignment: .center)
                                            
                                            Spacer()
                                            
                                            VStack(alignment: .center, spacing: 11) {
                                                HStack(alignment: .center, spacing: 10) {
                                                    
                                                }
                                                .padding(0)
                                                .frame(maxWidth: .infinity, minHeight: 62, maxHeight: 62, alignment: .leading)
                                                .background(.white)
                                                .cornerRadius(60)
                                                .overlay(
                                                  RoundedRectangle(cornerRadius: 60)
                                                    .inset(by: 0.25)
                                                    .stroke(Color(red: 0.9, green: 0.9, blue: 0.9), lineWidth: 0.5)
                                                )
                                                
                                                VStack(alignment: .center, spacing: 3) {
                                                    VStack(alignment: .leading, spacing: 10) {
                                                        
                                                    }
                                                    .padding(0)
                                                    .frame(maxWidth: .infinity, minHeight: 12, maxHeight: 12, alignment: .topLeading)
                                                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                                    
                                                    VStack(alignment: .leading, spacing: 10) {
                                                        
                                                    }
                                                    .padding(0)
                                                    .frame(width: 31, height: 12, alignment: .topLeading)
                                                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                                    
                                                }
                                                .padding(0)
                                                .frame(maxWidth: .infinity, alignment: .top)
                                            }
                                            .padding(0)
                                            .frame(width: 62, alignment: .center)
                                            
                                            Spacer()
                                            
                                            VStack(alignment: .center, spacing: 11) {
                                                HStack(alignment: .center, spacing: 10) {
                                                    
                                                }
                                                .padding(0)
                                                .frame(maxWidth: .infinity, minHeight: 62, maxHeight: 62, alignment: .leading)
                                                .background(.white)
                                                .cornerRadius(60)
                                                .overlay(
                                                  RoundedRectangle(cornerRadius: 60)
                                                    .inset(by: 0.25)
                                                    .stroke(Color(red: 0.9, green: 0.9, blue: 0.9), lineWidth: 0.5)
                                                )
                                                
                                                VStack(alignment: .center, spacing: 3) {
                                                    VStack(alignment: .leading, spacing: 10) {
                                                        
                                                    }
                                                    .padding(0)
                                                    .frame(maxWidth: .infinity, minHeight: 12, maxHeight: 12, alignment: .topLeading)
                                                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                                    
                                                    VStack(alignment: .leading, spacing: 10) {
                                                        
                                                    }
                                                    .padding(0)
                                                    .frame(width: 31, height: 12, alignment: .topLeading)
                                                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                                    
                                                }
                                                .padding(0)
                                                .frame(maxWidth: .infinity, alignment: .top)
                                            }
                                            .padding(0)
                                            .frame(width: 62, alignment: .center)
                                            
                                            Spacer()
                                            
                                            VStack(alignment: .center, spacing: 11) {
                                                HStack(alignment: .center, spacing: 10) {
                                                    
                                                }
                                                .padding(0)
                                                .frame(maxWidth: .infinity, minHeight: 62, maxHeight: 62, alignment: .leading)
                                                .background(.white)
                                                .cornerRadius(60)
                                                .overlay(
                                                  RoundedRectangle(cornerRadius: 60)
                                                    .inset(by: 0.25)
                                                    .stroke(Color(red: 0.9, green: 0.9, blue: 0.9), lineWidth: 0.5)
                                                )
                                                
                                                VStack(alignment: .center, spacing: 3) {
                                                    VStack(alignment: .leading, spacing: 10) {
                                                        
                                                    }
                                                    .padding(0)
                                                    .frame(maxWidth: .infinity, minHeight: 12, maxHeight: 12, alignment: .topLeading)
                                                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                                    
                                                    VStack(alignment: .leading, spacing: 10) {
                                                        
                                                    }
                                                    .padding(0)
                                                    .frame(width: 31, height: 12, alignment: .topLeading)
                                                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                                    
                                                }
                                                .padding(0)
                                                .frame(maxWidth: .infinity, alignment: .top)
                                            }
                                            .padding(0)
                                            .frame(width: 62, alignment: .center)
                                            
                                            
                                        
                                        }
                                        .padding(0)
                                        .frame(maxWidth: .infinity, alignment: .center)
                                        
                                        
                                    }
                                    .padding(0)
                                    .frame(maxWidth: .infinity, alignment: .topLeading)
                                    
                                    VStack(alignment: .leading, spacing: 20) {
                                        VStack(alignment: .leading, spacing: 10) {
                                            
                                        }
                                        .padding(0)
                                        .frame(width: 61, height: 8, alignment: .topLeading)
                                        .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                        
                                        HStack(alignment: .center) {
                                            VStack(alignment: .center, spacing: 11) {
                                                HStack(alignment: .center, spacing: 10) {
                                                    
                                                }
                                                .padding(0)
                                                .frame(maxWidth: .infinity, minHeight: 62, maxHeight: 62, alignment: .leading)
                                                .background(.white)
                                                .cornerRadius(60)
                                                .overlay(
                                                  RoundedRectangle(cornerRadius: 60)
                                                    .inset(by: 0.25)
                                                    .stroke(Color(red: 0.9, green: 0.9, blue: 0.9), lineWidth: 0.5)
                                                )
                                                
                                                VStack(alignment: .center, spacing: 3) {
                                                    VStack(alignment: .leading, spacing: 10) {
                                                        
                                                    }
                                                    .padding(0)
                                                    .frame(maxWidth: .infinity, minHeight: 12, maxHeight: 12, alignment: .topLeading)
                                                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                                    
                                                    VStack(alignment: .leading, spacing: 10) {
                                                        
                                                    }
                                                    .padding(0)
                                                    .frame(width: 31, height: 12, alignment: .topLeading)
                                                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                                    
                                                }
                                                .padding(0)
                                                .frame(maxWidth: .infinity, alignment: .top)
                                            }
                                            .padding(0)
                                            .frame(width: 62, alignment: .center)
                                            
                                            Spacer()
                                            
                                            VStack(alignment: .center, spacing: 11) {
                                                HStack(alignment: .center, spacing: 10) {
                                                    
                                                }
                                                .padding(0)
                                                .frame(maxWidth: .infinity, minHeight: 62, maxHeight: 62, alignment: .leading)
                                                .background(.white)
                                                .cornerRadius(60)
                                                .overlay(
                                                  RoundedRectangle(cornerRadius: 60)
                                                    .inset(by: 0.25)
                                                    .stroke(Color(red: 0.9, green: 0.9, blue: 0.9), lineWidth: 0.5)
                                                )
                                                
                                                VStack(alignment: .center, spacing: 3) {
                                                    VStack(alignment: .leading, spacing: 10) {
                                                        
                                                    }
                                                    .padding(0)
                                                    .frame(maxWidth: .infinity, minHeight: 12, maxHeight: 12, alignment: .topLeading)
                                                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                                    
                                                    VStack(alignment: .leading, spacing: 10) {
                                                        
                                                    }
                                                    .padding(0)
                                                    .frame(width: 31, height: 12, alignment: .topLeading)
                                                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                                    
                                                }
                                                .padding(0)
                                                .frame(maxWidth: .infinity, alignment: .top)
                                            }
                                            .padding(0)
                                            .frame(width: 62, alignment: .center)
                                            
                                            Spacer()
                                            
                                            VStack(alignment: .center, spacing: 11) {
                                                HStack(alignment: .center, spacing: 10) {
                                                    
                                                }
                                                .padding(0)
                                                .frame(maxWidth: .infinity, minHeight: 62, maxHeight: 62, alignment: .leading)
                                                .background(.white)
                                                .cornerRadius(60)
                                                .overlay(
                                                  RoundedRectangle(cornerRadius: 60)
                                                    .inset(by: 0.25)
                                                    .stroke(Color(red: 0.9, green: 0.9, blue: 0.9), lineWidth: 0.5)
                                                )
                                                
                                                VStack(alignment: .center, spacing: 3) {
                                                    VStack(alignment: .leading, spacing: 10) {
                                                        
                                                    }
                                                    .padding(0)
                                                    .frame(maxWidth: .infinity, minHeight: 12, maxHeight: 12, alignment: .topLeading)
                                                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                                    
                                                    VStack(alignment: .leading, spacing: 10) {
                                                        
                                                    }
                                                    .padding(0)
                                                    .frame(width: 31, height: 12, alignment: .topLeading)
                                                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                                    
                                                }
                                                .padding(0)
                                                .frame(maxWidth: .infinity, alignment: .top)
                                            }
                                            .padding(0)
                                            .frame(width: 62, alignment: .center)
                                            
                                            Spacer()
                                            
                                            VStack(alignment: .center, spacing: 11) {
                                                HStack(alignment: .center, spacing: 10) {
                                                    
                                                }
                                                .padding(0)
                                                .frame(maxWidth: .infinity, minHeight: 62, maxHeight: 62, alignment: .leading)
                                                .background(.white)
                                                .cornerRadius(60)
                                                .overlay(
                                                  RoundedRectangle(cornerRadius: 60)
                                                    .inset(by: 0.25)
                                                    .stroke(Color(red: 0.9, green: 0.9, blue: 0.9), lineWidth: 0.5)
                                                )
                                                
                                                VStack(alignment: .center, spacing: 3) {
                                                    VStack(alignment: .leading, spacing: 10) {
                                                        
                                                    }
                                                    .padding(0)
                                                    .frame(maxWidth: .infinity, minHeight: 12, maxHeight: 12, alignment: .topLeading)
                                                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                                    
                                                    VStack(alignment: .leading, spacing: 10) {
                                                        
                                                    }
                                                    .padding(0)
                                                    .frame(width: 31, height: 12, alignment: .topLeading)
                                                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                                    
                                                }
                                                .padding(0)
                                                .frame(maxWidth: .infinity, alignment: .top)
                                            }
                                            .padding(0)
                                            .frame(width: 62, alignment: .center)
                                            
                                            
                                        
                                        }
                                        .padding(0)
                                        .frame(maxWidth: .infinity, alignment: .center)
                                        
                                        HStack(alignment: .center) {
                                            VStack(alignment: .center, spacing: 11) {
                                                HStack(alignment: .center, spacing: 10) {
                                                    
                                                }
                                                .padding(0)
                                                .frame(maxWidth: .infinity, minHeight: 62, maxHeight: 62, alignment: .leading)
                                                .background(.white)
                                                .cornerRadius(60)
                                                .overlay(
                                                  RoundedRectangle(cornerRadius: 60)
                                                    .inset(by: 0.25)
                                                    .stroke(Color(red: 0.9, green: 0.9, blue: 0.9), lineWidth: 0.5)
                                                )
                                                
                                                VStack(alignment: .center, spacing: 3) {
                                                    VStack(alignment: .leading, spacing: 10) {
                                                        
                                                    }
                                                    .padding(0)
                                                    .frame(maxWidth: .infinity, minHeight: 12, maxHeight: 12, alignment: .topLeading)
                                                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                                    
                                                    VStack(alignment: .leading, spacing: 10) {
                                                        
                                                    }
                                                    .padding(0)
                                                    .frame(width: 31, height: 12, alignment: .topLeading)
                                                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                                    
                                                }
                                                .padding(0)
                                                .frame(maxWidth: .infinity, alignment: .top)
                                            }
                                            .padding(0)
                                            .frame(width: 62, alignment: .center)
                                            
                                            Spacer()
                                            
                                            VStack(alignment: .center, spacing: 11) {
                                                HStack(alignment: .center, spacing: 10) {
                                                    
                                                }
                                                .padding(0)
                                                .frame(maxWidth: .infinity, minHeight: 62, maxHeight: 62, alignment: .leading)
                                                .background(.white)
                                                .cornerRadius(60)
                                                .overlay(
                                                  RoundedRectangle(cornerRadius: 60)
                                                    .inset(by: 0.25)
                                                    .stroke(Color(red: 0.9, green: 0.9, blue: 0.9), lineWidth: 0.5)
                                                )
                                                
                                                VStack(alignment: .center, spacing: 3) {
                                                    VStack(alignment: .leading, spacing: 10) {
                                                        
                                                    }
                                                    .padding(0)
                                                    .frame(maxWidth: .infinity, minHeight: 12, maxHeight: 12, alignment: .topLeading)
                                                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                                    
                                                    VStack(alignment: .leading, spacing: 10) {
                                                        
                                                    }
                                                    .padding(0)
                                                    .frame(width: 31, height: 12, alignment: .topLeading)
                                                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                                    
                                                }
                                                .padding(0)
                                                .frame(maxWidth: .infinity, alignment: .top)
                                            }
                                            .padding(0)
                                            .frame(width: 62, alignment: .center)
                                            
                                            Spacer()
                                            
                                            VStack(alignment: .center, spacing: 11) {
                                                HStack(alignment: .center, spacing: 10) {
                                                    
                                                }
                                                .padding(0)
                                                .frame(maxWidth: .infinity, minHeight: 62, maxHeight: 62, alignment: .leading)
                                                .background(.white)
                                                .cornerRadius(60)
                                                .overlay(
                                                  RoundedRectangle(cornerRadius: 60)
                                                    .inset(by: 0.25)
                                                    .stroke(Color(red: 0.9, green: 0.9, blue: 0.9), lineWidth: 0.5)
                                                )
                                                
                                                VStack(alignment: .center, spacing: 3) {
                                                    VStack(alignment: .leading, spacing: 10) {
                                                        
                                                    }
                                                    .padding(0)
                                                    .frame(maxWidth: .infinity, minHeight: 12, maxHeight: 12, alignment: .topLeading)
                                                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                                    
                                                    VStack(alignment: .leading, spacing: 10) {
                                                        
                                                    }
                                                    .padding(0)
                                                    .frame(width: 31, height: 12, alignment: .topLeading)
                                                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                                    
                                                }
                                                .padding(0)
                                                .frame(maxWidth: .infinity, alignment: .top)
                                            }
                                            .padding(0)
                                            .frame(width: 62, alignment: .center)
                                            
                                            Spacer()
                                            
                                            VStack(alignment: .center, spacing: 11) {
                                                HStack(alignment: .center, spacing: 10) {
                                                    
                                                }
                                                .padding(0)
                                                .frame(maxWidth: .infinity, minHeight: 62, maxHeight: 62, alignment: .leading)
                                                .background(.white)
                                                .cornerRadius(60)
                                                .overlay(
                                                  RoundedRectangle(cornerRadius: 60)
                                                    .inset(by: 0.25)
                                                    .stroke(Color(red: 0.9, green: 0.9, blue: 0.9), lineWidth: 0.5)
                                                )
                                                
                                                VStack(alignment: .center, spacing: 3) {
                                                    VStack(alignment: .leading, spacing: 10) {
                                                        
                                                    }
                                                    .padding(0)
                                                    .frame(maxWidth: .infinity, minHeight: 12, maxHeight: 12, alignment: .topLeading)
                                                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                                    
                                                    VStack(alignment: .leading, spacing: 10) {
                                                        
                                                    }
                                                    .padding(0)
                                                    .frame(width: 31, height: 12, alignment: .topLeading)
                                                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                                    
                                                }
                                                .padding(0)
                                                .frame(maxWidth: .infinity, alignment: .top)
                                            }
                                            .padding(0)
                                            .frame(width: 62, alignment: .center)
                                            
                                            
                                        
                                        }
                                        .padding(0)
                                        .frame(maxWidth: .infinity, alignment: .center)
                                        
                                        
                                    }
                                    .padding(0)
                                    .frame(maxWidth: .infinity, alignment: .topLeading)
                                }
                                .padding(0)
                                .frame(maxWidth: .infinity, alignment: .top)
                                
                                
                                //banner design for the card
                                HStack(alignment: .center, spacing: 10) {
                                    
                                }
                                .padding(0)
                                .frame(maxWidth: .infinity, minHeight: 85, maxHeight: 85, alignment: .leading)
                                .background(.white)
                                .cornerRadius(10)
                                .overlay(
                                  RoundedRectangle(cornerRadius: 10)
                                    .inset(by: 0.25)
                                    .stroke(Color(red: 0.9, green: 0.9, blue: 0.9), lineWidth: 0.5)
                                )
                                
                                //banner design for the card
                                VStack(alignment: .center, spacing: 60) {
                                    VStack(alignment: .leading, spacing: 20) {
                                        VStack(alignment: .leading, spacing: 10) {
                                            
                                        }
                                        .padding(0)
                                        .frame(width: 61, height: 8, alignment: .topLeading)
                                        .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                        
                                        HStack(alignment: .center) {
                                            VStack(alignment: .center, spacing: 11) {
                                                HStack(alignment: .center, spacing: 10) {
                                                    
                                                }
                                                .padding(0)
                                                .frame(maxWidth: .infinity, minHeight: 62, maxHeight: 62, alignment: .leading)
                                                .background(.white)
                                                .cornerRadius(60)
                                                .overlay(
                                                  RoundedRectangle(cornerRadius: 60)
                                                    .inset(by: 0.25)
                                                    .stroke(Color(red: 0.9, green: 0.9, blue: 0.9), lineWidth: 0.5)
                                                )
                                                
                                                VStack(alignment: .center, spacing: 3) {
                                                    VStack(alignment: .leading, spacing: 10) {
                                                        
                                                    }
                                                    .padding(0)
                                                    .frame(maxWidth: .infinity, minHeight: 12, maxHeight: 12, alignment: .topLeading)
                                                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                                    
                                                    VStack(alignment: .leading, spacing: 10) {
                                                        
                                                    }
                                                    .padding(0)
                                                    .frame(width: 31, height: 12, alignment: .topLeading)
                                                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                                    
                                                }
                                                .padding(0)
                                                .frame(maxWidth: .infinity, alignment: .top)
                                            }
                                            .padding(0)
                                            .frame(width: 62, alignment: .center)
                                            
                                            Spacer()
                                            
                                            VStack(alignment: .center, spacing: 11) {
                                                HStack(alignment: .center, spacing: 10) {
                                                    
                                                }
                                                .padding(0)
                                                .frame(maxWidth: .infinity, minHeight: 62, maxHeight: 62, alignment: .leading)
                                                .background(.white)
                                                .cornerRadius(60)
                                                .overlay(
                                                  RoundedRectangle(cornerRadius: 60)
                                                    .inset(by: 0.25)
                                                    .stroke(Color(red: 0.9, green: 0.9, blue: 0.9), lineWidth: 0.5)
                                                )
                                                
                                                VStack(alignment: .center, spacing: 3) {
                                                    VStack(alignment: .leading, spacing: 10) {
                                                        
                                                    }
                                                    .padding(0)
                                                    .frame(maxWidth: .infinity, minHeight: 12, maxHeight: 12, alignment: .topLeading)
                                                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                                    
                                                    VStack(alignment: .leading, spacing: 10) {
                                                        
                                                    }
                                                    .padding(0)
                                                    .frame(width: 31, height: 12, alignment: .topLeading)
                                                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                                    
                                                }
                                                .padding(0)
                                                .frame(maxWidth: .infinity, alignment: .top)
                                            }
                                            .padding(0)
                                            .frame(width: 62, alignment: .center)
                                            
                                            Spacer()
                                            
                                            VStack(alignment: .center, spacing: 11) {
                                                HStack(alignment: .center, spacing: 10) {
                                                    
                                                }
                                                .padding(0)
                                                .frame(maxWidth: .infinity, minHeight: 62, maxHeight: 62, alignment: .leading)
                                                .background(.white)
                                                .cornerRadius(60)
                                                .overlay(
                                                  RoundedRectangle(cornerRadius: 60)
                                                    .inset(by: 0.25)
                                                    .stroke(Color(red: 0.9, green: 0.9, blue: 0.9), lineWidth: 0.5)
                                                )
                                                
                                                VStack(alignment: .center, spacing: 3) {
                                                    VStack(alignment: .leading, spacing: 10) {
                                                        
                                                    }
                                                    .padding(0)
                                                    .frame(maxWidth: .infinity, minHeight: 12, maxHeight: 12, alignment: .topLeading)
                                                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                                    
                                                    VStack(alignment: .leading, spacing: 10) {
                                                        
                                                    }
                                                    .padding(0)
                                                    .frame(width: 31, height: 12, alignment: .topLeading)
                                                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                                    
                                                }
                                                .padding(0)
                                                .frame(maxWidth: .infinity, alignment: .top)
                                            }
                                            .padding(0)
                                            .frame(width: 62, alignment: .center)
                                            
                                            Spacer()
                                            
                                            VStack(alignment: .center, spacing: 11) {
                                                HStack(alignment: .center, spacing: 10) {
                                                    
                                                }
                                                .padding(0)
                                                .frame(maxWidth: .infinity, minHeight: 62, maxHeight: 62, alignment: .leading)
                                                .background(.white)
                                                .cornerRadius(60)
                                                .overlay(
                                                  RoundedRectangle(cornerRadius: 60)
                                                    .inset(by: 0.25)
                                                    .stroke(Color(red: 0.9, green: 0.9, blue: 0.9), lineWidth: 0.5)
                                                )
                                                
                                                VStack(alignment: .center, spacing: 3) {
                                                    VStack(alignment: .leading, spacing: 10) {
                                                        
                                                    }
                                                    .padding(0)
                                                    .frame(maxWidth: .infinity, minHeight: 12, maxHeight: 12, alignment: .topLeading)
                                                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                                    
                                                    VStack(alignment: .leading, spacing: 10) {
                                                        
                                                    }
                                                    .padding(0)
                                                    .frame(width: 31, height: 12, alignment: .topLeading)
                                                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                                    
                                                }
                                                .padding(0)
                                                .frame(maxWidth: .infinity, alignment: .top)
                                            }
                                            .padding(0)
                                            .frame(width: 62, alignment: .center)
                                            
                                            
                                        
                                        }
                                        .padding(0)
                                        .frame(maxWidth: .infinity, alignment: .center)
                                        
                                        
                                    }
                                    .padding(0)
                                    .frame(maxWidth: .infinity, alignment: .topLeading)
                                    
                                    VStack(alignment: .leading, spacing: 20) {
                                        VStack(alignment: .leading, spacing: 10) {
                                            
                                        }
                                        .padding(0)
                                        .frame(width: 61, height: 8, alignment: .topLeading)
                                        .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                        
                                        HStack(alignment: .center) {
                                            VStack(alignment: .center, spacing: 11) {
                                                HStack(alignment: .center, spacing: 10) {
                                                    
                                                }
                                                .padding(0)
                                                .frame(maxWidth: .infinity, minHeight: 62, maxHeight: 62, alignment: .leading)
                                                .background(.white)
                                                .cornerRadius(60)
                                                .overlay(
                                                  RoundedRectangle(cornerRadius: 60)
                                                    .inset(by: 0.25)
                                                    .stroke(Color(red: 0.9, green: 0.9, blue: 0.9), lineWidth: 0.5)
                                                )
                                                
                                                VStack(alignment: .center, spacing: 3) {
                                                    VStack(alignment: .leading, spacing: 10) {
                                                        
                                                    }
                                                    .padding(0)
                                                    .frame(maxWidth: .infinity, minHeight: 12, maxHeight: 12, alignment: .topLeading)
                                                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                                    
                                                    VStack(alignment: .leading, spacing: 10) {
                                                        
                                                    }
                                                    .padding(0)
                                                    .frame(width: 31, height: 12, alignment: .topLeading)
                                                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                                    
                                                }
                                                .padding(0)
                                                .frame(maxWidth: .infinity, alignment: .top)
                                            }
                                            .padding(0)
                                            .frame(width: 62, alignment: .center)
                                            
                                            Spacer()
                                            
                                            VStack(alignment: .center, spacing: 11) {
                                                HStack(alignment: .center, spacing: 10) {
                                                    
                                                }
                                                .padding(0)
                                                .frame(maxWidth: .infinity, minHeight: 62, maxHeight: 62, alignment: .leading)
                                                .background(.white)
                                                .cornerRadius(60)
                                                .overlay(
                                                  RoundedRectangle(cornerRadius: 60)
                                                    .inset(by: 0.25)
                                                    .stroke(Color(red: 0.9, green: 0.9, blue: 0.9), lineWidth: 0.5)
                                                )
                                                
                                                VStack(alignment: .center, spacing: 3) {
                                                    VStack(alignment: .leading, spacing: 10) {
                                                        
                                                    }
                                                    .padding(0)
                                                    .frame(maxWidth: .infinity, minHeight: 12, maxHeight: 12, alignment: .topLeading)
                                                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                                    
                                                    VStack(alignment: .leading, spacing: 10) {
                                                        
                                                    }
                                                    .padding(0)
                                                    .frame(width: 31, height: 12, alignment: .topLeading)
                                                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                                    
                                                }
                                                .padding(0)
                                                .frame(maxWidth: .infinity, alignment: .top)
                                            }
                                            .padding(0)
                                            .frame(width: 62, alignment: .center)
                                            
                                            Spacer()
                                            
                                            VStack(alignment: .center, spacing: 11) {
                                                HStack(alignment: .center, spacing: 10) {
                                                    
                                                }
                                                .padding(0)
                                                .frame(maxWidth: .infinity, minHeight: 62, maxHeight: 62, alignment: .leading)
                                                .background(.white)
                                                .cornerRadius(60)
                                                .overlay(
                                                  RoundedRectangle(cornerRadius: 60)
                                                    .inset(by: 0.25)
                                                    .stroke(Color(red: 0.9, green: 0.9, blue: 0.9), lineWidth: 0.5)
                                                )
                                                
                                                VStack(alignment: .center, spacing: 3) {
                                                    VStack(alignment: .leading, spacing: 10) {
                                                        
                                                    }
                                                    .padding(0)
                                                    .frame(maxWidth: .infinity, minHeight: 12, maxHeight: 12, alignment: .topLeading)
                                                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                                    
                                                    VStack(alignment: .leading, spacing: 10) {
                                                        
                                                    }
                                                    .padding(0)
                                                    .frame(width: 31, height: 12, alignment: .topLeading)
                                                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                                    
                                                }
                                                .padding(0)
                                                .frame(maxWidth: .infinity, alignment: .top)
                                            }
                                            .padding(0)
                                            .frame(width: 62, alignment: .center)
                                            
                                            Spacer()
                                            
                                            VStack(alignment: .center, spacing: 11) {
                                                HStack(alignment: .center, spacing: 10) {
                                                    
                                                }
                                                .padding(0)
                                                .frame(maxWidth: .infinity, minHeight: 62, maxHeight: 62, alignment: .leading)
                                                .background(.white)
                                                .cornerRadius(60)
                                                .overlay(
                                                  RoundedRectangle(cornerRadius: 60)
                                                    .inset(by: 0.25)
                                                    .stroke(Color(red: 0.9, green: 0.9, blue: 0.9), lineWidth: 0.5)
                                                )
                                                
                                                VStack(alignment: .center, spacing: 3) {
                                                    VStack(alignment: .leading, spacing: 10) {
                                                        
                                                    }
                                                    .padding(0)
                                                    .frame(maxWidth: .infinity, minHeight: 12, maxHeight: 12, alignment: .topLeading)
                                                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                                    
                                                    VStack(alignment: .leading, spacing: 10) {
                                                        
                                                    }
                                                    .padding(0)
                                                    .frame(width: 31, height: 12, alignment: .topLeading)
                                                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                                    
                                                }
                                                .padding(0)
                                                .frame(maxWidth: .infinity, alignment: .top)
                                            }
                                            .padding(0)
                                            .frame(width: 62, alignment: .center)
                                            
                                            
                                        
                                        }
                                        .padding(0)
                                        .frame(maxWidth: .infinity, alignment: .center)
                                        
                                        HStack(alignment: .center) {
                                            VStack(alignment: .center, spacing: 11) {
                                                HStack(alignment: .center, spacing: 10) {
                                                    
                                                }
                                                .padding(0)
                                                .frame(maxWidth: .infinity, minHeight: 62, maxHeight: 62, alignment: .leading)
                                                .background(.white)
                                                .cornerRadius(60)
                                                .overlay(
                                                  RoundedRectangle(cornerRadius: 60)
                                                    .inset(by: 0.25)
                                                    .stroke(Color(red: 0.9, green: 0.9, blue: 0.9), lineWidth: 0.5)
                                                )
                                                
                                                VStack(alignment: .center, spacing: 3) {
                                                    VStack(alignment: .leading, spacing: 10) {
                                                        
                                                    }
                                                    .padding(0)
                                                    .frame(maxWidth: .infinity, minHeight: 12, maxHeight: 12, alignment: .topLeading)
                                                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                                    
                                                    VStack(alignment: .leading, spacing: 10) {
                                                        
                                                    }
                                                    .padding(0)
                                                    .frame(width: 31, height: 12, alignment: .topLeading)
                                                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                                    
                                                }
                                                .padding(0)
                                                .frame(maxWidth: .infinity, alignment: .top)
                                            }
                                            .padding(0)
                                            .frame(width: 62, alignment: .center)
                                            
                                            Spacer()
                                            
                                            VStack(alignment: .center, spacing: 11) {
                                                HStack(alignment: .center, spacing: 10) {
                                                    
                                                }
                                                .padding(0)
                                                .frame(maxWidth: .infinity, minHeight: 62, maxHeight: 62, alignment: .leading)
                                                .background(.white)
                                                .cornerRadius(60)
                                                .overlay(
                                                  RoundedRectangle(cornerRadius: 60)
                                                    .inset(by: 0.25)
                                                    .stroke(Color(red: 0.9, green: 0.9, blue: 0.9), lineWidth: 0.5)
                                                )
                                                
                                                VStack(alignment: .center, spacing: 3) {
                                                    VStack(alignment: .leading, spacing: 10) {
                                                        
                                                    }
                                                    .padding(0)
                                                    .frame(maxWidth: .infinity, minHeight: 12, maxHeight: 12, alignment: .topLeading)
                                                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                                    
                                                    VStack(alignment: .leading, spacing: 10) {
                                                        
                                                    }
                                                    .padding(0)
                                                    .frame(width: 31, height: 12, alignment: .topLeading)
                                                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                                    
                                                }
                                                .padding(0)
                                                .frame(maxWidth: .infinity, alignment: .top)
                                            }
                                            .padding(0)
                                            .frame(width: 62, alignment: .center)
                                            
                                            Spacer()
                                            
                                            VStack(alignment: .center, spacing: 11) {
                                                HStack(alignment: .center, spacing: 10) {
                                                    
                                                }
                                                .padding(0)
                                                .frame(maxWidth: .infinity, minHeight: 62, maxHeight: 62, alignment: .leading)
                                                .background(.white)
                                                .cornerRadius(60)
                                                .overlay(
                                                  RoundedRectangle(cornerRadius: 60)
                                                    .inset(by: 0.25)
                                                    .stroke(Color(red: 0.9, green: 0.9, blue: 0.9), lineWidth: 0.5)
                                                )
                                                
                                                VStack(alignment: .center, spacing: 3) {
                                                    VStack(alignment: .leading, spacing: 10) {
                                                        
                                                    }
                                                    .padding(0)
                                                    .frame(maxWidth: .infinity, minHeight: 12, maxHeight: 12, alignment: .topLeading)
                                                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                                    
                                                    VStack(alignment: .leading, spacing: 10) {
                                                        
                                                    }
                                                    .padding(0)
                                                    .frame(width: 31, height: 12, alignment: .topLeading)
                                                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                                    
                                                }
                                                .padding(0)
                                                .frame(maxWidth: .infinity, alignment: .top)
                                            }
                                            .padding(0)
                                            .frame(width: 62, alignment: .center)
                                            
                                            Spacer()
                                            
                                            VStack(alignment: .center, spacing: 11) {
                                                HStack(alignment: .center, spacing: 10) {
                                                    
                                                }
                                                .padding(0)
                                                .frame(maxWidth: .infinity, minHeight: 62, maxHeight: 62, alignment: .leading)
                                                .background(.white)
                                                .cornerRadius(60)
                                                .overlay(
                                                  RoundedRectangle(cornerRadius: 60)
                                                    .inset(by: 0.25)
                                                    .stroke(Color(red: 0.9, green: 0.9, blue: 0.9), lineWidth: 0.5)
                                                )
                                                
                                                VStack(alignment: .center, spacing: 3) {
                                                    VStack(alignment: .leading, spacing: 10) {
                                                        
                                                    }
                                                    .padding(0)
                                                    .frame(maxWidth: .infinity, minHeight: 12, maxHeight: 12, alignment: .topLeading)
                                                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                                    
                                                    VStack(alignment: .leading, spacing: 10) {
                                                        
                                                    }
                                                    .padding(0)
                                                    .frame(width: 31, height: 12, alignment: .topLeading)
                                                    .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                                    
                                                }
                                                .padding(0)
                                                .frame(maxWidth: .infinity, alignment: .top)
                                            }
                                            .padding(0)
                                            .frame(width: 62, alignment: .center)
                                            
                                            
                                        
                                        }
                                        .padding(0)
                                        .frame(maxWidth: .infinity, alignment: .center)
                                        
                                        
                                    }
                                    .padding(0)
                                    .frame(maxWidth: .infinity, alignment: .topLeading)
                                }
                                .padding(0)
                                .frame(maxWidth: .infinity, alignment: .top)
                                
                            }
                            .padding(.horizontal, 24)
                            .padding(.vertical, 80)
                            
                            Spacer() // Pushes content up
                        }
                        .frame(minHeight: geometry.size.height - 22) // Ensure VStack fills ScrollView minus padding
                        .padding(.top, 20)
                        .frame(maxWidth: .infinity)
                    }
                    .background(Color.white)
                    .cornerRadius(20)
                }
                .ignoresSafeArea(.container, edges: .all)
                .padding(.bottom, 11) // This specifically ignores the top safe area
            }
        }
    }




#Preview {
    more()
}
