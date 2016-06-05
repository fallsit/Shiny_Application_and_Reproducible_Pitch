
library(UsingR)
library(ggplot2)

fit<-lm(child~parent,galton)
galtonAndPred <- data.frame(galton, predict(fit, interval = 'prediction'))


childHeight<-function(parentHeight){
newdata<-data.frame(parent=parentHeight)
as.numeric(predict(fit,newdata))
}

interval<-function(parentHeight){
    newdata<-data.frame(parent=parentHeight)
    newdata2<-predict(fit,newdata,interval="confidence")
    paste("[",round(newdata2[2],4),",",round(newdata2[3],4),"]")
}

shinyServer(
    function(input, output) {
        output$text1 <- renderPrint({input$slider})
        output$text2 <- renderPrint({childHeight(input$slider)})
        output$text3 <- renderPrint({interval(input$slider)})
        output$plot<-renderPlot({
                                ggplot(galtonAndPred,aes(parent,child))+xlab("Parents height")+ylab("Children's predicted height")+geom_vline(xintercept=input$slider, colour='blue', size=2) +geom_point() +geom_smooth(method="lm",aes(fill = 'confidence'), col="yellow")+geom_ribbon(aes(y = fit, ymin = lwr, ymax = upr, fill = 'prediction'),alpha = 0.3)+scale_fill_manual('Interval', values = c('green', 'pink'))+ggtitle("Children's predicted height vs parent height") +theme(legend.position = c(0.08, 0.90),plot.title = element_text(lineheight=.2, face="bold",colour="red"))+scale_x_continuous(breaks=62:75)+scale_y_continuous(breaks=62:74)
                                
                              
            })
    }
)