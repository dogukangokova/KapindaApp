
import SwiftUI

struct DetailView: View {
    @EnvironmentObject var baseData: BaseViewModel
    var animation: Namespace.ID
    @State private var value = 0
        let step = 5
        let range = 1...50
    
  
    var body: some View {
        if let product = baseData.currentProduct, baseData.showDetail{
            VStack(spacing: 0){
                HStack{
                    Button{
                        withAnimation{
                            baseData.showDetail = false
                        }
                        
                    } label: {
                        Image(systemName: "arrow.left")
                            .font(.title2)
                            .foregroundColor(.black)
                    }
                    
                    Spacer()
                    
                    Button{
                        
                    } label: {
                        Image(systemName: "suit.heart.fill")
                            .foregroundColor(.white)
                            .padding(8)
                            .background(Color.red, in: Circle())
                    }
                }
                .foregroundColor(.black)
                .overlay(
                    Image("gps")
                        .resizable()
                        .renderingMode(.template)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color(.orange))
                )
                Text("Tuzla, İstasyon Mah.")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
                .padding(.horizontal)
                .padding(.bottom)
                
                // Resim
                Image(product.productImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250, height: 250)
                    .padding(.top, 50)
                    .matchedGeometryEffect(id: product.productImage, in: animation)
                    .background(
                    
                        ZStack{
                            Circle()
                                .fill(product.productBG)
                                .padding()
                            Circle()
                                .fill(Color.white.opacity(0.5))
                                .padding(60)
                        }
                    )
                    .frame(height: getScreenBounds().height / 3)
                    .padding(.bottom, 20)
                
                //Detay
                VStack(alignment: .leading, spacing: 15){
                    HStack{
                        Text(product.productTitle)
                            .font(.title.bold())
                            .padding(.leading, 10)
                        Spacer(minLength: 10)
                        
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        
                        Text("(\(product.productRating).0)")
                            .font(.caption.bold())
                            .foregroundColor(.gray)
                            .padding(.trailing, 10)
                    }
                    HStack{
                        Text(product.productDesc)
                            .font(.footnote)
                            .foregroundColor(Color(.darkGray))
                            .padding(.leading, 10)
                        
                        Spacer(minLength: 10)
                        
                        Text(product.productPrice)
                            .font(.title2.bold())
                            .padding(.trailing, 10)
                    }
                    
                    
                    Text("Serin ve kuru ortamda muhafaza ediniz. Doğrudan güneş ışığına maruz bırakmayınız.\nSoğuk içiniz")
                        .font(.callout)
                        .padding(10)
                        .lineSpacing(10)
                    
                    Button {
                        
                    } label: {
                        HStack(spacing: 15){
                            Image("bag")
                                .resizable()
                                .renderingMode(.template)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20)
                            
                            
                            
                            
                            Text("Sepete Ekle")
                                .fontWeight(.bold)
                            
                        }
                        .foregroundColor(.blue)
                        .padding(.vertical, 15)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue.opacity(0.06))
                        .clipShape(Capsule())
                    }
                    .padding(.top)
                   
 
                }
                .padding(.top, 20)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .background(Color.gray.opacity(0.06))
                .cornerRadius(20)
                .ignoresSafeArea(.container, edges: .bottom)
                /*.background(Color.blue.opacity(0.05)
                        .opacity(0.05)
                        .cornerRadius(20)
                        .ignoresSafeArea(.container, edges: .bottom)
                )*/
                Stepper(value: $value,
                                in: range,
                                step: step) {
                            Text("Current: \(value) in \(range.description) " +
                                 "stepping by \(step)")
                        }
                            .padding(10)
                
            }
            .padding(.top, -5)
            .padding(10)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .background(Color.white)
            .transition(.opacity)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView()
    }
}


extension View{
    func getScreenBounds()->CGRect{
        return UIScreen.main.bounds
        
    }
}
