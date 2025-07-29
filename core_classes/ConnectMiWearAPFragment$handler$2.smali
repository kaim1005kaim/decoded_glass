.class final Lcom/superhexa/lib/channel/presentation/ConnectMiWearAPFragment$handler$2;
.super Lkotlin/jvm/internal/Lambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/superhexa/lib/channel/presentation/ConnectMiWearAPFragment;-><init>(Lkotlin/jvm/functions/Function1;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function0<",
        "Landroid/os/Handler;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0008\n\u0000\n\u0002\u0018\u0002\n\u0000\u0010\u0000\u001a\u00020\u0001H\n\u00a2\u0006\u0002\u0008\u0002"
    }
    d2 = {
        "<anonymous>",
        "Landroid/os/Handler;",
        "invoke"
    }
    k = 0x3
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field final synthetic a:Lcom/superhexa/lib/channel/presentation/ConnectMiWearAPFragment;


# direct methods
.method constructor <init>(Lcom/superhexa/lib/channel/presentation/ConnectMiWearAPFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/superhexa/lib/channel/presentation/ConnectMiWearAPFragment$handler$2;->a:Lcom/superhexa/lib/channel/presentation/ConnectMiWearAPFragment;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method

.method public static synthetic a(Lcom/superhexa/lib/channel/presentation/ConnectMiWearAPFragment;Landroid/os/Message;)Z
    .locals 0

    invoke-static {p0, p1}, Lcom/superhexa/lib/channel/presentation/ConnectMiWearAPFragment$handler$2;->b(Lcom/superhexa/lib/channel/presentation/ConnectMiWearAPFragment;Landroid/os/Message;)Z

    move-result p0

    return p0
.end method

.method private static final b(Lcom/superhexa/lib/channel/presentation/ConnectMiWearAPFragment;Landroid/os/Message;)Z
    .locals 5

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "it"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->p(Ljava/lang/Object;Ljava/lang/String;)V

    sget-object v0, Ltimber/log/Timber;->a:Ltimber/log/Timber$Forest;

    const-string v1, "ConnectMiWearAP"

    invoke-virtual {v0, v1}, Ltimber/log/Timber$Forest;->j(Ljava/lang/String;)Ltimber/log/Timber$Tree;

    move-result-object v2

    iget v3, p1, Landroid/os/Message;->what:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    const-string v4, "\u6d88\u606f\u7c7b\u578b it.what %s"

    invoke-virtual {v2, v4, v3}, Ltimber/log/Timber$Tree;->i(Ljava/lang/String;[Ljava/lang/Object;)V

    iget p1, p1, Landroid/os/Message;->what:I

    const/16 v2, 0xc9

    const/4 v3, 0x1

    if-ne p1, v2, :cond_0

    invoke-static {p0}, Lcom/superhexa/lib/channel/presentation/ConnectMiWearAPFragment;->access$timeOutLogic(Lcom/superhexa/lib/channel/presentation/ConnectMiWearAPFragment;)V

    return v3

    :cond_0
    const/16 v2, 0xcb

    if-ne p1, v2, :cond_1

    invoke-static {p0}, Lcom/superhexa/lib/channel/presentation/ConnectMiWearAPFragment;->access$removeSelf(Lcom/superhexa/lib/channel/presentation/ConnectMiWearAPFragment;)V

    return v3

    :cond_1
    const/16 v2, 0xcd

    const/4 v4, 0x0

    if-ne p1, v2, :cond_2

    invoke-static {p0}, Lcom/superhexa/lib/channel/presentation/ConnectMiWearAPFragment;->access$getCurrentState$p(Lcom/superhexa/lib/channel/presentation/ConnectMiWearAPFragment;)Lcom/superhexa/lib/channel/presentation/BlueConnectState;

    move-result-object p1

    sget-object v2, Lcom/superhexa/lib/channel/presentation/BlueConnectState$SuccessCreateWifi;->a:Lcom/superhexa/lib/channel/presentation/BlueConnectState$SuccessCreateWifi;

    invoke-static {p1, v2}, Lkotlin/jvm/internal/Intrinsics;->g(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_2

    invoke-virtual {v0, v1}, Ltimber/log/Timber$Forest;->j(Ljava/lang/String;)Ltimber/log/Timber$Tree;

    move-result-object p1

    const-string v0, "createWifi\u7684\u547d\u4ee4\u8d85\u65f6 \uff0c\u6ca1\u6536\u5230 \u54cd\u5e94 \uff0c\u91cd\u65b0createWifi\u4e00\u6b21"

    new-array v1, v4, [Ljava/lang/Object;

    invoke-virtual {p1, v0, v1}, Ltimber/log/Timber$Tree;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-static {p0}, Lcom/superhexa/lib/channel/presentation/ConnectMiWearAPFragment;->access$getViewModel(Lcom/superhexa/lib/channel/presentation/ConnectMiWearAPFragment;)Lcom/superhexa/lib/channel/presentation/ConnectMiWearAPViewModel;

    move-result-object p0

    invoke-virtual {p0}, Lcom/superhexa/lib/channel/presentation/ConnectMiWearAPViewModel;->d()Lkotlinx/coroutines/Job;

    return v3

    :cond_2
    return v4
.end method


# virtual methods
.method public final invoke()Landroid/os/Handler;
    .locals 3
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 2
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    iget-object p0, p0, Lcom/superhexa/lib/channel/presentation/ConnectMiWearAPFragment$handler$2;->a:Lcom/superhexa/lib/channel/presentation/ConnectMiWearAPFragment;

    new-instance v2, Lcom/superhexa/lib/channel/presentation/f;

    invoke-direct {v2, p0}, Lcom/superhexa/lib/channel/presentation/f;-><init>(Lcom/superhexa/lib/channel/presentation/ConnectMiWearAPFragment;)V

    invoke-direct {v0, v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;Landroid/os/Handler$Callback;)V

    return-object v0
.end method

.method public bridge synthetic invoke()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/superhexa/lib/channel/presentation/ConnectMiWearAPFragment$handler$2;->invoke()Landroid/os/Handler;

    move-result-object p0

    return-object p0
.end method
