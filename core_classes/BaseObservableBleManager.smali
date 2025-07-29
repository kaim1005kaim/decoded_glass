.class public abstract Lcom/superhexa/supervision/library/bluetooth/base/BaseObservableBleManager;
.super Lno/nordicsemi/android/ble/BleManager;
.source "SourceFile"


# instance fields
.field public final a:Landroidx/lifecycle/LiveData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/lifecycle/LiveData<",
            "Lno/nordicsemi/android/ble/livedata/state/ConnectionState$State;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    invoke-direct {p0, p1, v0}, Lno/nordicsemi/android/ble/BleManager;-><init>(Landroid/content/Context;Landroid/os/Handler;)V

    new-instance p1, Lcom/superhexa/supervision/library/bluetooth/state/ConnectionStateObserver;

    new-instance v0, Lcom/superhexa/supervision/library/bluetooth/base/n;

    invoke-direct {v0, p0}, Lcom/superhexa/supervision/library/bluetooth/base/n;-><init>(Lcom/superhexa/supervision/library/bluetooth/base/BaseObservableBleManager;)V

    invoke-direct {p1, v0}, Lcom/superhexa/supervision/library/bluetooth/state/ConnectionStateObserver;-><init>(Lcom/superhexa/supervision/library/bluetooth/interf/IBleStateCallback;)V

    iput-object p1, p0, Lcom/superhexa/supervision/library/bluetooth/base/BaseObservableBleManager;->a:Landroidx/lifecycle/LiveData;

    check-cast p1, Lno/nordicsemi/android/ble/observer/ConnectionObserver;

    invoke-virtual {p0, p1}, Lno/nordicsemi/android/ble/BleManager;->setConnectionObserver(Lno/nordicsemi/android/ble/observer/ConnectionObserver;)V

    return-void
.end method


# virtual methods
.method public abstract m(Lno/nordicsemi/android/ble/livedata/state/ConnectionState$State;)V
.end method
